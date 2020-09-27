Feature:
  Yo como usuario estoy logeado puedo ver la lista de albumes creados

  Background:
    * url pageUrl
    * def jsonAlbumesList = read('../jsons/response-list-albums.json')

  Scenario Outline: listado de albumes
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
