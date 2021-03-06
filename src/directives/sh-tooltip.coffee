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
# @file_name src/directives/sh-tooltip.coffee
# @author Giovanni Sakti
# @email giosakti@starqle.com
# @company PT. Starqle Indonesia
# @note This file contains shTooltip directive
# =============================================================================

"use strict"

angular.module('sh.tooltip', []).directive "shTooltip", ->
  restrict: "A"
  link: (scope, element, attrs) ->
    $(element).tooltip 
      title: attrs.shTooltip
      placement: "top"
      html: true
    return
