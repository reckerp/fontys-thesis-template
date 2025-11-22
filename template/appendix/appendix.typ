// Appendix content
// This file contains supplementary material for the thesis

// Reset heading counter and set appendix numbering
#counter(heading).update(0)
#set heading(numbering: "A.1", supplement: [Appendix])

= Additional Technical Documentation

This appendix contains supplementary material that supports the main thesis but is too detailed or tangential to include in the main chapters.

== Database Schema

Below is the complete database schema used in the project.

#figure(
  table(
    columns: (auto, auto, auto),
    [*Table*], [*Column*], [*Type*],
    [users], [id], [INTEGER],
    [users], [username], [VARCHAR(255)],
    [users], [email], [VARCHAR(255)],
    [users], [created_at], [TIMESTAMP],
    [products], [id], [INTEGER],
    [products], [name], [VARCHAR(255)],
    [products], [price], [DECIMAL],
    [orders], [id], [INTEGER],
    [orders], [user_id], [INTEGER],
    [orders], [total], [DECIMAL],
  ),
  caption: [Database schema overview]
)

== API Documentation

=== User Service Endpoints

*GET /api/users/:id*

Returns user information for the specified user ID.

Response format:
#figure(
  align(left)[
    ```json
    {
      "id": 123,
      "username": "johndoe",
      "email": "john@example.com",
      "created_at": "2024-01-15T10:30:00Z"
    }
    ```
  ],
  caption: [User information response],
)

== Code Samples

#figure(
  align(left)[
    ```javascript
    // Example of circuit breaker pattern implementation
    class ServiceClient {
      constructor(serviceName, circuitBreaker) {
        this.serviceName = serviceName;
        this.circuitBreaker = circuitBreaker;
      }

      async makeRequest(endpoint, data) {
        return this.circuitBreaker.execute(async () => {
          const response = await fetch(
            `${this.baseUrl}${endpoint}`,
            {
              method: 'POST',
              headers: { 'Content-Type': 'application/json' },
              body: JSON.stringify(data)
            }
          );
          
          if (!response.ok) {
            throw new Error(`Service error: ${response.status}`);
          }
          
          return response.json();
        });
      }
    }
    ```
  ],
  caption: [Circuit breaker pattern implementation],
)

#figure(
  align(left)[
    ```sql
    -- Migration script for separating user data
    -- Run date: 2024-11-01

    CREATE DATABASE user_service;

    USE user_service;

    CREATE TABLE users (
      id INT PRIMARY KEY AUTO_INCREMENT,
      username VARCHAR(255) NOT NULL UNIQUE,
      email VARCHAR(255) NOT NULL UNIQUE,
      password_hash VARCHAR(255) NOT NULL,
      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    );

    -- Migrate data from monolith
    INSERT INTO user_service.users 
    SELECT id, username, email, password_hash, created_at, updated_at
    FROM monolith.users;
    ```
  ],
  caption: [Database migration script],
)
