# Library System Interview Question

This project shows the minimal core funtionality of a Library System in Ruby on Rails. It allows users to browse books, borrow them, and return them. The Interview question required no authentication to be added to the application. The basic functionality includes:

* **User Management:** The system is managed by the library patron who oversees all transactions on the system. Creation of a new library user/borrower. Creation of new books. Updating borrow and return logs for each book.

* **Book Management:** View a list of all books, View te details of a single book including its borrow history, Create, update, and delete books.(Admin functionality)

## Setup

1. **Clone the repository:**

    ```bash
    git clone <repository_url>
    cd book_lending_library
    ```

2. **Install dependencies:**

    ```bash
    bundle install
    ```

3. **Create and migrate the database:**

    ```bash
    rails db:create
    rails db:migrate
    ```

4.  **Start the Rails server:**

    ```bash
    rails server
    ```

5.  **Open the application in your browser:**

    Visit `http://localhost:3000`

## Running Tests

    ```bash
    bundle exec rspec spec
    ```


