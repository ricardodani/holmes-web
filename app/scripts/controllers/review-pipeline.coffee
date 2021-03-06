'use strict'

class ReviewPipelineCtrl
  constructor: (@scope, @NextJobsFcty, @WebSocketFcty) ->
    @reviews = []
    @reviewCount = 0
    @pageSize = 10

    @getReviews()

    @WebSocketFcty.on((message) =>
      @getReviews()
    )

    @scope.$on '$destroy', @_cleanUp

  _cleanUp: =>
    @WebSocketFcty.clearHandlers()

  _fillReviews: (data) =>
    @reviews = data.pages
    @reviewCount = data.reviewCount
    @reviewsLoaded = data.pages.length

  getReviews: (currentPage, pageSize) ->
    pageSize = if not pageSize then @pageSize
    @NextJobsFcty.getNextJobs({current_page: currentPage, page_size: pageSize}).then @_fillReviews, =>
      @reviewsLoaded = null

  updateReviews: (currentPage, pageSize) =>
    pageSize = if not pageSize then @pageSize
    @getReviews(currentPage, pageSize)


angular.module('holmesApp')
  .controller 'ReviewPipelineCtrl', ($scope, NextJobsFcty, WebSocketFcty) ->
    $scope.model = new ReviewPipelineCtrl($scope, NextJobsFcty, WebSocketFcty)
