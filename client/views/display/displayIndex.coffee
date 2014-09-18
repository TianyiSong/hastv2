ModuleLoader.define 'mathjax',
  source: "http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML",
  verify: ->
    return window.MathJax

Template.displayIndex.rendered = ->
  self = @
  ModuleLoader.load 'mathjax'
  self.$('#editor-input').keyup _.debounce(
    ->
      preview = self.$('#preview').html(kramed(@value))
      MathJax?.Hub.Queue ['Typeset', MathJax.Hub, 'preview']
    , 500)
