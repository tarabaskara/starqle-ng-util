# =============================================================================
# Copyright (c) 2013 All Right Reserved, http://starqle.com/
#
# This source is subject to the Starqle Permissive License.
# Please see the License.txt file for more information.
# All other rights reserved.
#
# THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
# KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
# PARTICULAR PURPOSE.
#
# @file_name app/scripts/directives/sh-collapsible.coffee
# @author Raymond Ralibi
# @email ralibi@starqle.com
# @company PT. Starqle Indonesia
# @note This file contains sh-collapsible, sh-collapsible-control, and sh-collapsible-body directive
# =============================================================================

#
# sh-collapsible
#
angular.module('sh.collapsible', []).directive("shCollapsible", ->
  restrict: 'AEC'
  scope:
    shCollapsibleCollapsed: '@?'
    shCollapsibleCollapseFn: '&'
    shCollapsibleExpandFn: '&'
  controller: ['$scope', '$element', '$timeout', ($scope, $element, $timeout) ->
    @shCollapse = false
    @bodyElements = []

    @toggleCollapse = () ->
      @shCollapse = not @shCollapse
      if @isCollapse()
        for bodyElement in @bodyElements
          bodyElement.slideUp('fast', () ->
            $timeout (->
              $(window).trigger('resize')
            ), 10
          )
          $element.addClass('is-collapse')
      else
        for bodyElement in @bodyElements
          bodyElement.slideDown('fast', () ->
            $timeout (->
              $(window).trigger('resize')
            ), 10
          )
          $element.removeClass('is-collapse')


      return

    @addCollapsibleBodyElement = (element) ->
      @bodyElements.push element
      return

    @isCollapse = () ->
      @shCollapse

    return
  ]
  controllerAs: 'shCollapsibleController'
  link: (scope, element, attrs, shCollapsibleController) ->

    scope.shCollapsibleExpandFn
      expandFn: () ->
        if shCollapsibleController.isCollapse()
          shCollapsibleController.toggleCollapse()

    scope.shCollapsibleCollapseFn
      collapseFn: () ->
        unless shCollapsibleController.isCollapse()
          shCollapsibleController.toggleCollapse()


    if scope.shCollapsibleCollapsed is 'true'
      shCollapsibleController.toggleCollapse()
    return

).directive("shCollapsibleBody", ->
  restrict: 'AEC'
  scope: {}
  require: '^shCollapsible'
  link: (scope, element, attrs, shCollapsibleController) ->
    shCollapsibleController.addCollapsibleBodyElement(element)
    return

).directive("shCollapsibleControl", ->
  restrict: 'AEC'
  scope: {}
  require: '^shCollapsible'
  link: (scope, element, attrs, shCollapsibleController) ->
    element.bind 'click', ->
      shCollapsibleController.toggleCollapse()
      return
    return
)
