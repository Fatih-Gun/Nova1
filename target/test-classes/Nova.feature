

Feature: Checking four points in the space are a square

   #Happy path
  Scenario Outline: Space is a square
    Given User should be able to go to the Coordinate Data Enter Page
    When Enters "<Coordinate 1>" , "<Coordinate 2>" , "<Coordinate 3>" and "<Coordinate 4>"
    And Click the check button
    Then User should be able to see the new mock-up page

    Examples:
      | Coordinate 1  | Coordinate 2   | Coordinate 3        | Coordinate 4  |
      | 1,2           |     4,2        |      4,5            |        1,5    |
      | 3,7           |     11,7       |      11,15          |       3,15    |
      | -2,3          |     -7,3       |      -7,-2          |      -2,-2    |


  #Negative
  Scenario Outline: Space is not a square
    Given User should be able to go to the Coordinate Data Enter Page
    When Enters "<Coordinate 1>" , "<Coordinate 2>" , "<Coordinate 3>" and "<Coordinate 4>"
    And Click the check button
    Then Check if the space is not square give "<errorMessage>"

    Examples:
      | Coordinate 1  | Coordinate 2   | Coordinate 3        | Coordinate 4  |    errorMessage        |
      | 1,9           |     4,2        |      4,5            |        1,5    | Space is not a square  |
      | 3,3           |     11,7       |      11,15          |       3,15    | Space is not a square  |
      | -2,1          |     -7,3       |      -7,-2          |      -2,-2    | Space is not a square  |

  #Negative
  Scenario Outline: Coordinates must not be empty
    Given User should be able to go to the Coordinate Data Enter Page
    When Enters "<Coordinate 1>" , "<Coordinate 2>" , "<Coordinate 3>" and "<Coordinate 4>"
    And Click the check button
    Then The error message "<errorMessage>" should be displayed

    Examples:
      | Coordinate 1  | Coordinate 2   | Coordinate 3        | Coordinate 4  |        errorMessage           |
      | 1,2           |     4,2        |      4,5            |               |  Coordinate must not be blank |
      | 1,2           |     4,2        |                     |      1,5      |  Coordinate must not be blank |
      | 1,2           |                |      4,5            |      1,5      |  Coordinate must not be blank |
      |               |     4,2        |      4,5            |      1,5      |  Coordinate must not be blank |

   #Negative
  Scenario Outline: Each coordinate format must be suitable
    Given User should be able to go to the Coordinate Data Enter Page
    When Enters "<Coordinate 1>" , "<Coordinate 2>" , "<Coordinate 3>" and "<Coordinate 4>"
    And Click the check button
    Then The error message "<errorMessage>" should be displayed

    Examples:
      | Coordinate 1  | Coordinate 2   | Coordinate 3        | Coordinate 4  |        errorMessage                                      |
      | 1.2           |     4.2        |      4.5            |      1.5      |  Each coordinate will be separated with commas  (##,##)  |
      | 1/2           |     4/2        |      4/5            |      1/5      |  Each coordinate will be separated with commas  (##,##)  |
      | 1;2           |     4;2        |      4;5            |      1;5      |  Each coordinate will be separated with commas  (##,##)  |
      | 1'2           |     4'2        |      4'5            |      1'5      |  Each coordinate will be separated with commas  (##,##)  |
      | 1-2           |     4-2        |      4-5            |      1-5      |  Each coordinate will be separated with commas  (##,##)  |
      | 1_2           |     4_2        |      4_5            |      1_5      |  Each coordinate will be separated with commas  (##,##)  |
      | 1*2           |     4*2        |      4*5            |      1*5      |  Each coordinate will be separated with commas  (##,##)  |


