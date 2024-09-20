Feature: Rest API Testing with Karate

  Background:
    * url 'https://gorest.co.in/public/v2'
    * def token = 'c1c7fbbc52487a2e60f9e185b7c024817a5af9f8701b20f461fd4f8b15e25467'

  Scenario: Create a new user
    Given path 'users'
    And request { name: 'kalai', gender: 'female', email: 'tenali.kalaivani@29e.com', status: 'active', age: 25 }
    And header Authorization = 'Bearer ' + token
    When method post
    Then status 201
    * def userId = response.id // Use Karate's built-in function to set variable
    And karate.log('UserId from Create Scenario:', userId)
    And match response.gender == 'female'
    * karate.set('userId', userId) // Store userId in Karate context

  Scenario: Update the user
    * def userId = karate.get('userId') // Retrieve the userId from the previous scenario
    * print userId
    Given path 'users', userId
    And request { name: 'kalaivani' }
    And header Authorization = 'Bearer ' + token
    When method put
    Then status 200
    And karate.log('Response Body after update:', response)

  Scenario: Delete the user
    * def userId = karate.get('userId') // Retrieve the userId from the previous scenario
    Given path 'users', userId
    And header Authorization = 'Bearer ' + token
    When method delete
    Then status 204
    And karate.log('Response Status Code after delete:', responseStatus)
