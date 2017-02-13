command: 'cat ~/"Library/Mobile Documents/com~apple~CloudDocs/Tasks.org"'

refreshFrequency: 10000

style: """
  indentation = 25px

  color: #fff
  font-family: -apple-system
  width: 600px
  bottom: 50px
  left: 10px

  h1,h2,h3,h4,h5
   margin: 0
   font-weight: 500
   line-height: 1.25em

  h2:before,h3:before,h4:before,h5:before
    content: '◦'
    position: absolute
    margin-left: -12px

  h2,h3,h4,h5
    margin-left: 10px

  h1
    font-size: 16px
    font-weight: 700
    margin-top: 1em

  h2
    font-size: 16px
    margin-left: indentation

  h3
    font-size: 14px
    margin-left: indentation * 2

  h4
    font-size: 12px
    margin-left: indentation * 3

  h5
    font-size: 10px
    margin-left: indentation * 4

  .status
    font-weight:  700

  .closed
    color: #F1FA8C

  .done
    color: #50FA7B

  .todo
    color: #FFB86C
"""

render: (output) -> """
  <div></div>
"""

update: (output, domEl) ->
  dom = $(domEl)

  output = output.replace(/^\*\s+(.+)/gm, '<h1>$1</h1>')
  output = output.replace(/^\*{2}\s+(.+)/gm, '<h2>$1</h2>')
  output = output.replace(/^\*{3}\s+(.+)/gm, '<h3>$1</h3>')
  output = output.replace(/^\*{4}\s+(.+)/gm, '<h4>$1</h4>')
  output = output.replace(/^\*{5}\s+(.+)/gm, '<h5>$1</h5>')
  output = output.replace(/CLOSED:/gm, '<span class="status closed">CLOSED</span> ')
  output = output.replace(/DONE\s/gm, '<span class="status done">DONE</span> ')
  output = output.replace(/TODO\s/gm, '<span class="status todo">TODO</span> ')

  dom.html output
