Feature:
  i'm inside of the page and i can watch the list of albums purchased

  Background:
    * url pageUrl
    * def jsonBodyList = read('../jsons/response-list-purchased-albums.json')

  Scenario Outline: list of the purchased albums
    * def typeUser = <userMail> == 'adminUser' ? adminUser : regularUser
    And def dataLogin = call read('login.feature@LoginUser') {email: '#(typeUser)'}
    * def userId = dataLogin.response.user_id
    Given path 'users/'+userId+'/albums'
    And header Authorization = dataLogin.responseHeaders.Authorization[0]
    And request {}
    When method get
    And match each response == jsonBodyList
    Then status 200
    Examples:
      | userMail      |
      | 'adminUser'   |
      | 'regularUser' |
