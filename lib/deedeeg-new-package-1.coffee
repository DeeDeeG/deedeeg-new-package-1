DeedeegNewPackage1View = require './deedeeg-new-package-1-view'
{CompositeDisposable} = require 'atom'

module.exports = DeedeegNewPackage1 =
  deedeegNewPackage1View: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @deedeegNewPackage1View = new DeedeegNewPackage1View(state.deedeegNewPackage1ViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @deedeegNewPackage1View.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'deedeeg-new-package-1:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @deedeegNewPackage1View.destroy()

  serialize: ->
    deedeegNewPackage1ViewState: @deedeegNewPackage1View.serialize()

  toggle: ->
    console.log 'DeedeegNewPackage1 was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
