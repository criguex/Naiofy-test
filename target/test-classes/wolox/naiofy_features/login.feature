Feature:
  Yo como usuario hago login

  Background:
    * url pageUrl
    * def jsonBody = read('../jsons/response-login.json')

  @LoginUsers
  Scenario Outline: login de usuario
    Given path 'users','sessions'
    * def credentials = {email: '<newUserMail>',password: '<newUserPassword>'}
    And request credentials
    When method post
    And match responseHeaders.Authorization != ''
    And match response == jsonBody
    Then status 200

    Examples:
      | newUserMail | newUserPassword   |
      | #(adminUser)   | #(clave)       |
      | #(regularUser) | #(clave)       |

  @ignore @LoginUser
  Scenario:login de usuario
    Given path 'users','sessions'
    * def user = {email: '#(email)'}
    * def credentials = {email: '#(user.email)',password: '#(clave)'}
    And request credentials
    When method post
    And match responseHeaders.Authorization != ''
    And match response == jsonBody
    Then status 200