Unit 8: Group Milestone - README
===

# gratuit

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
Maps/lists events happening within a given radius of an individual, specifically those providing free products (e.g. food, pens, sunglasses - essentially any free item).

### App Evaluation
- **Category:** Lifestyle
- **Mobile:** This app would be primarily developed for mobile. While it may be viable on a computer, it would restrict usability as locations would not be updated as frequently. Hence, we will be aiming to develop a mobile version.
- **Story:** Allows users to provide information about events with free products and to search for nearby events with free products
- **Market:** Anyone that is interested in acquiring free products/merchandise can use this product. Ability to star events based on interests allows users with unique interests to save relevant content.
- **Habit:** This app could be used as frequently as the user wants, depending on how often they choose to seek out free products, and what exactly they’re looking for.
- **Scope:** Starting out with a narrow focus, mainly just providing free products of any sort. Extended to display geographical locations on a map given a preset radius from the user's device location. 

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

1. User can create an account (sign up).
2. User stays logged in across restarts.
3. User can add a new event.
4. Events can be displayed in a map view to user.

**Optional Nice-to-have Stories**

1. User can star an event.
2. Starred events are shown in a table view to user.
3. All events are shown in a table view to user.
4. User can add a photo for the product at a given event.

### 2. Screen Archetypes

1. User can create an account (sign up).
<img width="218" alt="Screen Shot 2022-03-19 at 5 35 18 PM" src="https://user-images.githubusercontent.com/70518439/159139168-1367bd8b-c0bd-4e83-ba2d-be83cbf25215.png">
2. User stays logged in across restarts.
<img width="240" alt="Screen Shot 2022-03-19 at 5 30 13 PM" src="https://user-images.githubusercontent.com/70518439/159139248-47a15783-8e91-4bdd-bf62-dea989ddfbd5.png">
3. User can add a new event.
<img width="226" alt="Screen Shot 2022-03-19 at 5 30 45 PM" src="https://user-images.githubusercontent.com/70518439/159139097-b12335ca-0b62-4901-ab6a-066966a8dd0c.png">
4. Events can be displayed in a map view to user.
<img width="159" alt="Screen Shot 2022-03-19 at 5 50 12 PM" src="https://user-images.githubusercontent.com/70518439/159139615-be8bca71-6d84-481d-a0a5-46570efce616.png">

**Optional event user stories**
1. User can star an event.
<img width="157" alt="Screen Shot 2022-03-19 at 5 50 33 PM" src="https://user-images.githubusercontent.com/70518439/159139621-cbc43c1d-1de6-4f42-ae28-ab83b04a7706.png">
2. Starred events are shown in a table view to user.
<img width="157" alt="Screen Shot 2022-03-19 at 5 50 43 PM" src="https://user-images.githubusercontent.com/70518439/159139627-43d18faf-8468-49ce-924a-33f17d5620f9.png">
3. All events are shown in a table view to user.
<img width="157" alt="Screen Shot 2022-03-19 at 5 50 33 PM" src="https://user-images.githubusercontent.com/70518439/159139635-bd70b6f4-6526-4be0-a0fd-8d6a38a306c2.png">
4. User can add a photo for the product at a given event.
<img width="226" alt="Screen Shot 2022-03-19 at 5 30 45 PM" src="https://user-images.githubusercontent.com/70518439/159139210-ac8d221d-7247-426c-91c2-a0d29210b317.png">

### 3. Navigation

**Flow Navigation** (Screen to Screen)

* Sign up
   * Create account button (goes to 'Map view')
* Login
   * Create account button (goes to 'Sign up')
   * Login button (goes to 'Map view')
* Map view [DEFAULT]
   * Create event button (goes to 'Create event')
   * Table view (goes to 'Event list')
   * Starred events (goes to 'My events')
* Event list
   * Create event button (goes to 'Create event')
   * Map view (goes to 'Map view')
   * Starred events (goes to 'My events')
* My events
   * Map view (goes to 'Map view')
   * Table view (goes to 'Event list')
* Create event
   * Submit button (goes to 'Map view')

**Tab Navigation** (Tab to Screen)

* Map view [2nd Tab Button -> Table View of Events]
* List view (optional user story) [1st Tab Button -> Map View]
* Starred events (optional user story) [1st Tab Button -> Map View, 2nd Tab Button -> Table View of Events]

## Wireframes
[Add picture of your hand sketched wireframes in this section]
<img src="YOUR_WIREFRAME_IMAGE_URL" width=600>

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models
[Add table of models]
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
