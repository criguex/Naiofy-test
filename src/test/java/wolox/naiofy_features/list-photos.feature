Feature:
  i'm inside of the page and i can watch the list of photos

  Background:
    * url pageUrl
    * def dataAlbumes = call read('list-albums.feature')
    * def jsonBodyList = read('../jsons/response-list-photos.json')

  Scenario Outline: lista de fotos de un album
    * def typeUser = <userMail> == 'adminUser' ? adminUser : regularUser
    And def dataLogin = call read('login.feature@LoginUser') {email: '#(typeUser)'}
    * def idAlbum = dataAlbumes.response[6].id
    Given path 'albums/'+idAlbum+'/photos'
    And header Authorization = dataLogin.responseHeaders.Authorization[0]
    When method get
    And match each response == jsonBodyList
    Then status 200

    Examples:
      | userMail      |
      | 'adminUser'   |
      | 'regularUser' |
