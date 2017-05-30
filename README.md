 # Blocmetrics 
---
### _An **analytics service** to track events on websites._
> Built with the help of [https://www.bloc.io](http://bloc.io) and powered by Ruby on Rails with a little Javascript
***
#### This analytics service offers:
1.  A client-side JavaScript snippet that allows a user to track events on their website.
2.  A server-side API that captures and saves those events to a database.
3.  A Rails application that displays the captured event data for a user.

#### How I created the Javacript snippet used to track events from registered applications:
*  `blocmetrics.report()` is the one function my snippet needs to support
*  In order to keep my code from colliding with other JavaScript code, I created a namespace for it by declaring an empty object in the application.js file `var blocmetrics = {};`
*  Then I created the report function as a property on that object `blocmetrics.report = function(eventName){`
*  Inside the biometrics.report function I created an event JSON object to send to the analytics service `var event = {event: { name: eventName }};`
*  Then  initialized a new XMLHttpRequest() (AJAX request) `var request = new XMLHttpRequest();`
*  Then set the HTTP method to POST, the url of the events endpoint, and gave the value of true which allows the request to run asynchronously. `request.open("POST", "http://localhost:3000/api/events", true);`
*  Then set the request Content-Type header to "application/json" which is mandatory, otherwise my API::EventsController wouldn't know to process the request as JSON `request.setRequestHeader('Content-Type', 'application/json');`
*  Then finally we send the request `request.send(JSON.stringify(event));`

##### Here's the full snippet which can be used by you to capture analytical info from your website:
```javascript
var blocmetrics = {};
blocmetrics.report = function(eventName) {
  var event = {event: {name:eventName}};
  var request = new XMLHttpRequest();
  request.open("POST", "https://blocmetrics-jeffmoore.c9users.io:8080/api/events", true);
  request.setRequestHeader("Content-Type", "application/json");
  request.send(JSON.stringify(event));
}
```

##### Don't forget to set and name the event you want to capture:
1.  add `blocmetrics.report("sale");` below the snippet in your application.js file
2.  Head on over to my [Blocmetrics](https://radiant-beyond-40529.herokuapp.com/) page and sign up for a free account
3.  Register the site you'd like to provide an analytics service for by providing the site name and url
4.  Visit the site frequently to see your updated details


> Thanks for viewing this and feel free to make any comments or suggestions to me [Jeff Moore](jmas1_2000@hotmail.com)