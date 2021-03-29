Feature: sell collectibles

  As a user
  So I can make money
  I want to sell my collectibles
  
Background: users have been added to database

  Given the following users registered:
  | username                | password_digest |
  | john123                 | 123456          |

  And the following collectibles exist:
  | name                         | rarity               | url                                                                                                                                                   | value |
  | Kitska Warmbestrarity        | C                | https://lh3.googleusercontent.com/4YPexPRmyHJ_BW_f41KKO-QdOD_vffe0ndD3tt7vu7ZCsPydNBSVy1Je-7F781SLgWP37ujmkHqhGSBUYSp4nGxKitBd6MqDlxkssg=s992         |	10    |
  | ACryptoPunk #3100            | C                | https://publish.one37pm.net/wp-content/uploads/2021/02/punks.png?fit=600%2C600                                                                        | 11    |
  | Portrait of a Collector      | C               | https://lh3.googleusercontent.com/tSyl3XXZmI6YI1SD3lccyyO8NOw20xxOLR0pSn-2CFqHkIRIhRnCpEaQhIIrAYdcdt0siH3AY5bY0yKldI_pkZxVNXA_HVJSUeMM=s992           | 12    |
  | F1 Delta Time                | C               | https://hackernoon.com/images/IZH5VrBxylTJuG6oTbU11LwJemA3-st7r3fy6.png                                                                               |	13    |

  And the following assets exist:
  | user_id                | collectible_id    | on_the_market  |
  | 1                      | 1                 | f              |
  | 1                      | 3                 | f              |
  | 2                      | 4                 | f              |

  And the following products exist:
  | user_id    | asset_id    | sell_price    |

Scenario: sell my collectibles
  Given I am on the homepage
  Given I am logged_in as "john123"
  When I follow "Manage Collectibles"
  Then  I should be on the collectibles page for "john123"
  Given I sell "Kitska Warmbestrarity"
  And I should see button "unlist"
  And I follow "Market"
  Then I should be on the market page for "john123"
  And I should see "Price"
  And I should see "Kitska Warmbestrarity"
  And I should see "10"
