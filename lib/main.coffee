root = document.documentElement

module.exports =
  activate: (state) ->
    atom.config.observe 'benty-ui.fontSize', (value) ->
      setFontSize(value)

    # atom.config.observe 'benty-ui.layoutMode', (value) ->
    #   setLayoutMode(value)

    atom.config.observe 'benty-ui.tabSizing', (value) ->
      setTabSizing(value)

    atom.config.observe 'benty-ui.hideDockButtons', (value) ->
      setHideDockButtons(value)

    # DEPRECATED: This can be removed at some point (added in Atom 1.17/1.18ish)
    # It removes `layoutMode`
    # if atom.config.get('benty-ui.layoutMode')
    #   atom.config.unset('benty-ui.layoutMode')

  deactivate: ->
    unsetFontSize()
    unsetTabSizing()
    unsetHideDockButtons()


# Font Size -----------------------

setFontSize = (currentFontSize) ->
  if Number.isInteger(currentFontSize)
    root.style.fontSize = "#{currentFontSize}px"
  else if currentFontSize is 'Auto'
    unsetFontSize()

unsetFontSize = ->
  root.style.fontSize = ''

# Layout Mode -----------------------
# setLayoutMode = (layoutMode) ->
#   root.setAttribute('theme-benty-ui-layoutmode', layoutMode.toLowerCase())
#
# unsetLayoutMode = ->
#   root.removeAttribute('theme-benty-ui-layoutmode')

# Tab Sizing -----------------------

setTabSizing = (tabSizing) ->
  root.setAttribute('theme-benty-ui-tabsizing', tabSizing.toLowerCase())

unsetTabSizing = ->
  root.removeAttribute('theme-benty-ui-tabsizing')


# Dock Buttons -----------------------

setHideDockButtons = (hideDockButtons) ->
  if hideDockButtons
    root.setAttribute('theme-benty-ui-dock-buttons', 'hidden')
  else
    unsetHideDockButtons()

unsetHideDockButtons = ->
  root.removeAttribute('theme-benty-ui-dock-buttons')
