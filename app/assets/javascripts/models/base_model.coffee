angular.module('Models').factory('BaseModel', ->
  class BaseModel
    extractHasManyRelation: (factory, properties, key) ->
      if _(properties).has(key)
        rv = factory.generateFromJSON(properties[key])
        delete properties[key]
        return rv
      else
        return []

    extractHasOneRelation: (factory, properties, key) ->
      if _(properties).has(key)
        rv = factory.generateFromJSON(properties[key])
        delete properties[key]
        return rv
      else
        return null

    extractHasManyThroughRelation: (factory, properties, collectionName, foreignKey) ->
      if _(properties).has(collectionName)
        result = []
        for elem in properties[collectionName]
          if _(elem).has(foreignKey)
            result.push(factory.generateFromJSON(elem[foreignKey]))

        return result
      else
        return []

    extractDateTime: (properties, key) ->
      if _(properties).has(key)
        rv = moment(properties[key])
        delete properties[key]
        return rv
      else
        return null

    @generateFromJSON: (factory, json) ->
      return null unless json?
      if _(json).isArray()
        objs = []
        for elem in json
          objs.push(new factory(elem))
        return objs
      else
        return new factory(json)

  return BaseModel
)
