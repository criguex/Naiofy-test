Feature:
  i'm inside of the page and i can watch the list of albums

  Background:
    * url pageUrl
    * def jsonAlbumesList = read('../jsons/response-list-albums.json')

  Scenario Outline: List of albums
    * def typeUser = <userMail> == 'adminUser' ? adminUser : regularUser
    And def dataLogin = call read('login.feature@LoginUser') {email: '#(typeUser)'}
    Given path 'albums'
    And header Authorization = dataLogin.responseHeaders.Authorization[0]
    When method get
    And match each response == jsonAlbumesList
    Then status 200

    Examples:
      | userMail    |
      | 'adminUser'   |
      | 'regularUser' |
