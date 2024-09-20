Feature: Sample API Test

Background:
    * url 'https://reqres.in/api'

Scenario: Get list of users
    Given path 'users'
    When method GET
    Then status 200
    And match response.data[0].id == 1

Scenario: Create a new user
    Given path 'users'
    And request { name: 'John', job: 'leader' }
    When method POST
    Then status 201
    And match response.name == 'John'
    And match response.job == 'leader'

Scenario Outline: Get user by ID
    Given path 'users', <userId>
    When method GET
    Then status 200
    And match response.data.id == <userId>

    Examples:
        | userId |
        | 1      |
        | 2      |

Scenario: Update a user
    Given path 'users', 2
    And request { name: 'Jane', job: 'developer' }
    When method PUT
    Then status 200
    And match response.name == 'Jane'
    And match response.job == 'developer'

Scenario: Delete a user
    Given path 'users', 2
    When method DELETE
    Then status 204

Scenario: Custom function example
    * def isEven = function(x){ return x % 2 == 0 }
    * def number = 4
    * assert isEven(number)
