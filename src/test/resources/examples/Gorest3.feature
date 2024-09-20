Feature: Rest API Testing with Karate

  Background:
    * url 'https://gorest.co.in/public/v2'
    * def token = 'c1c7fbbc52487a2e60f9e185b7c024817a5af9f8701b20f461fd4f8b15e25467'

  Scenario: Create, Update, and Delete a user
    # Create a new user
    Given path 'users'
    And request 
    """
    {
      "name": "Kalai",
      "gender": "female",
      "email": "tenali.kalaivani@280e.com",
      "status": "active"
    }
    """
    And header Authorization = 'Bearer ' + token
    When method post
    Then status 201
    * def userId = response.id
    And karate.log('UserId is', userId)
    And match response.gender == 'female'

    # Update the user
    Given path 'users', userId
    And request { name: 'Kalaivani' }
    And header Authorization = 'Bearer ' + token
    When method put
    Then status 200
    And karate.log('Response Body after update:', response)

    # Delete the user
    Given path 'users', userId
    And header Authorization = 'Bearer ' + token
    When method delete
    Then status 204
    And karate.log('Response Status Code after delete:', responseStatus)
