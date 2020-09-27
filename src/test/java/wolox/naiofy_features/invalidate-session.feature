Feature:
  i'm inside of the page and i can invalidate session

  Background:
    * url pageUrl

  Scenario Outline: invlidate sesssion
    * def typeUser = <userMail> == 'adminUser' ? adminUser : regularUser
    And def dataLogin = call read('login.feature@LoginUser') {email: '#(typeUser)'}
    * def userId = dataLogin.response
    Given path 'users','sessions','invalidate_all'
    And request {}
    And header Authorization = dataLogin.responseHeaders.Authorization[0]
    When method post
    Then status 200
    Examples:
      | userMail      |
      | 'adminUser'   |
      | 'regularUser' |
