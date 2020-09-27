Feature:
  Yo como persona me registro

  Background:
    * url pageUrl
    * def random = call read('utils.js')

  Scenario Outline: registro de usuario
    Given path 'users'
    * def emailRandom = random+'<newUserMail>'
    * def bodyUser = {email: '#(emailRandom)',password: '(<newUserPassword>)',firstName: '(<newUserFirstName>)',lastName: '(<newUserLastName>)'}
    And request bodyUser
    When method post
    Then status <status>

    Examples:
      | newUserMail                  | newUserPassword   | newUserFirstName |newUserLastName|status|
      | cristianadmin@wolox.com.ar   | candidatoWolox2020| cristian         |    guerra     |  201|
      | cristianregular@wolox.com.ar | candidatoWolox2020| cristian         |    guerra     |  201|
      | cristianadmin@hotmail.com    | candidatoWolox2020| cristian         |    guerra     |  422|
      | cristianadmin@gmail.com      | candidatoWolox2020| cristian         |    guerra     |  422|
      | cristianadmin@wolox.com.ar   | candidatoWolox2020| cristian15       |    guerra     |  422|
      | cristianregular@wolox.com.ar | candidatoWolox2020| cristian1        |    guerra22   |  422|
