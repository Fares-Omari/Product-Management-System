Product Management System

This is a simple product management system built using Ruby on Rails. It includes user authentication, admin functionality for managing products (CRUD operations), file uploads via Active Storage, and modern Rails features like Turbo Links for seamless navigation.

Features
 1. User Authentication
 - Admin and regular users supported using Devise.
 2. Admin Product Management
 - Admin users can add, edit, delete, and view products.
 3. File Uploads
 - Product images are uploaded using Rails’ Active Storage.
 4. Turbo Links Integration
 - Asynchronous page updates without full-page reloads.
 5. Responsive Design
 - Styled using Bootstrap for a clean, responsive UI.
 6. Unit and System Tests
 - Thorough test coverage for models and system-level features.

Requirements

Environment Setup
 1. Install Ruby 3.3.7and Rails 8.0.1.
 - Use  rbenv tool for Ruby installation.
 2. Install and configure a database .
 3. Clone the repository and set up dependencies.

Installation
 1. Clone the repository:

git clone https://github.com/fares22-glitch/Product-Management-System

cd product-management-system  


 2. Install dependencies:

bundle install 


 3. Set up the database:

rails db:create  
rails db:migrate  
rails db:seed  


 4. Start the Rails server:

rails server  


 5. Open the application in your browser:

http://localhost:3000  

Seeded Admin User

The database is pre-seeded with an admin user for testing purposes

Usage
 1. Home Page:
 - Displays a “Sign In” button at the top.
 - Lists products if they exist; otherwise, shows “No Products Found.”
 2. Admin Features:
 - Log in as the admin user to access the Products Page.
 - Add new products using the “New Product” button.
 - Edit or delete products via the product list.
 3. Turbo Links Integration:
 - Opening/closing the Add/Edit Product modal is smooth and asynchronous.

Running Tests
 1. Run model and system tests using Rails’ built-in test framework:
    

rails test  


 2. Tests include:
 - Model Tests: Validation of attributes and relationships for User and Product models.
   

rails test taest/models

 - System Tests: User flows, including logging in, adding/editing products, and edge cases.
   

rails test taest/system


Technical Details

Database Schema

Users Table

- Column Type Description
- id (Primary key)
- name string Name of the user
- email string Unique email address
- role string Admin or User
- password string Encrypted password

Products Table

- Column Type Description
- id bigint Primary key
- name string Product name
- description text Product description
- price decimal Product price
- currency string Currency Like USD
- quantity integer Product quantity
- image string Active Storage for image uploads

Turbo Links Integration
 - Turbo Links is used for asynchronous updates.
 - CRUD operations (Add/Edit/Delete) are handled via modals and updated in real-time.

Styling
 - Bootstrap is used for responsive design.
 - The “New Product” button is styled with a prominent color.
 - Product images are displayed as thumbnails in the list.

Notes
 - The application follows Rails conventions and best practices.
 - Proper error handling and validations are implemented.
 - Tested thoroughly for edge cases.
