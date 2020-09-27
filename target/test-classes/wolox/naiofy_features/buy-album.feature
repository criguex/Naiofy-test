Feature:
  Yo como usuario estoy logeado entonces puedo comprar un album

  Background:
    * url pageUrl
    * def dataAlbumes = call read('list-albums.feature')
    * def random = call read('utils.js')

  Scenario Outline:  Yo como usuario compro un album
    * def typeUser = <userMail> == 'adminUser' ? adminUser : regularUser
    And def dataLogin = call read('login.feature@LoginUser') {email: '#(typeUser)'}
    * def idAlbum = dataAlbumes.response[<nAlbum>].id
    Given path 'albums/'+idAlbum
    And header Authorization = dataLogin.responseHeaders.Authorization[0]
    And request {}
    When method POST
    Then status <statusCod>
    Examples:
      | userMail      | nAlbum   |statusCod|
      | 'adminUser'   | random   |201|
      | 'regularUser' | random   |201|
      | 'adminUser'   | 5        |422|
      | 'regularUser' | 5        |422|
