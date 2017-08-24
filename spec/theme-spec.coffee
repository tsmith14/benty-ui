describe "Benty UI theme", ->
  beforeEach ->
    waitsForPromise ->
      atom.packages.activatePackage('benty-ui')

  it "allows the font size to be set via config", ->
    expect(document.documentElement.style.fontSize).toBe ''

    atom.config.set('benty-ui.fontSize', '10')
    expect(document.documentElement.style.fontSize).toBe '10px'

    atom.config.set('benty-ui.fontSize', 'Auto')
    expect(document.documentElement.style.fontSize).toBe ''

  it "allows the layout mode to be set via config", ->
    expect(document.documentElement.getAttribute('theme-benty-ui-layoutmode')).toBe 'auto'

    atom.config.set('benty-ui.layoutMode', 'Spacious')
    expect(document.documentElement.getAttribute('theme-benty-ui-layoutmode')).toBe 'spacious'

  it "allows the tab sizing to be set via config", ->
    expect(document.documentElement.getAttribute('theme-benty-ui-tabsizing')).toBe 'auto'

    atom.config.set('benty-ui.tabSizing', 'Minimum')
    expect(document.documentElement.getAttribute('theme-benty-ui-tabsizing')).toBe 'minimum'
