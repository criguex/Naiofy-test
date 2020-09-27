Feature:
  i'm inside of the page and i can watch the list of users

  Background:
    * url pageUrl
    * def jsonBodyUserList = read('../jsons/response-list-users.json')
    * def jsonBodyList = read('../jsons/response-list-users-body.json')

  Scenario Outline: list of users
    * def typeUser = <userMail> == 'adminUser' ? adminUser : regularUser
    Given path 'users'
    And def dataLogin = call read('login.feature@LoginUser') {email: '#(typeUser)'}
    And header Authorization = dataLogin.responseHeaders.Authorization[0]
    When method get
    And match each response.page[*] == jsonBodyUserList
    And match response == jsonBodyList
    Then status 200

    Examples:
      | userMail    |
      | 'adminUser'   |
      | 'regularUser' |
