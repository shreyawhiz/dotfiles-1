command: "date +%A,%B,%e,%Y"

refreshFrequency: 50000

style: """
  /* Modify Colors and Size Here:*/

  size = 800px                //This is just a base for the overall size so everything stays centered

  width: size
  margin-left: -.5 * size     //Set left edge of widget to be center so it can be easily centered on the page
  font-smoothing: antialiased
  text-align: center

  height: 230px
  margin-top: -.5 * 130px
  vertical-align: middle

  /*POSITION*/
  top: calc(50% - 100px)
  left: 50%

  /*COLORS*/
  primaryColor = rgba(255,255,255,0.55)
  secondaryColor = rgba(255,255,255,0.35)


  font-family: -apple-system
  font-weight: 200
  font-size: 46px

  #main
    color: primaryColor
    font-size: 64px

  #suffix
    color: primaryColor
    margin-left: -10px         //Forces suffix to be closer to numDate

  #secondary
    color: secondaryColor
"""

render: (output) -> """
  <div>
    <span id="main"></span>
    <sup id="suffix"></sup>
  </div>
  <div id="secondary"></div>

"""

update: (output) ->
  dateInfo = output.split(',')

  day = dateInfo[0]
  month = dateInfo[1]
  numDate = parseInt(dateInfo[2])
  year = dateInfo[3]

  secondDigit = numDate%10

  # This switch determines the appropriate suffix for the numDate:
  suffix = switch
    when numDate is 1 then 'st'
    when numDate is 2 then 'nd'
    when numDate is 3 then 'rd'
    when numDate < 21 then 'th'
    when numDate is 21 then 'st'
    when numDate is 22 then 'nd'
    when numDate is 23 then 'rd'
    when numDate < 31 then 'th'
    when numDate is 31 then 'st'
    else 'ERROR'

  top = day+" the "+numDate
  bottom = month+", "+year

  $('#main').text top           #Add day and numDate to main
  $('#suffix').text suffix      #Add suffix to numDate
  $('#secondary').text bottom   #Add month and year to secondary
