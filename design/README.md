# Initial design decisions and thoughts

Apache Guacamole has many nice things, but I think most of it's client-side is not useful for what I want to achieve with this project. The guacamole-client is written in Java and has a Javascript frontend, I suppose I could still use the Java part and rewrite the frontend to only implement what I care about, but I decided to first check rewrites of the client:

- https://github.com/wwt/guac (guacamole-client written in Go)
  - https://github.com/wwt/guac-vue (vue frontend for it)
- https://github.com/vadimpronin/guacamole-lite (nodeJS replacement for the Java servlet)

Out of the two the Go version seems more interesting to try-out, but the guacamole-lite project has twice as many stars.
