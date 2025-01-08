# Project Setup for Local Development

This document provides step-by-step instructions for setting up the project for local development without Nginx.

## Prerequisites

Make sure you have the following installed on your local machine:

- **Docker**: Ensure Docker is installed and running.
- **Composer**: Install Composer for dependency management if not already installed.
- **PHP**: PHP version 8.0 or higher is required for running the application locally.
- **MySQL**: A MySQL database should be running locally or remotely.

## Getting Started

Follow these steps to set up the project locally:

### 1. Clone the Repository

Clone the repository to your local machine:

```bash
git clone <repository-url>
cd <repository-name>
```

### 2. Install Dependencies

Install PHP dependencies using Composer:

```bash
composer install
```

### 3. Create Environment File

Copy the `.env.example` file to `.env` and update it with your local configuration:

```bash
cp .env.example .env
```

Update the following variables in the `.env` file:

- **DB_CONNECTION**: Database connection type (e.g., `mysql`)
- **DB_HOST**: Database host (e.g., `127.0.0.1`)
- **DB_PORT**: Database port (default: `3306`)
- **DB_DATABASE**: Database name
- **DB_USERNAME**: Database username
- **DB_PASSWORD**: Database password

### 4. Generate Application Key

Generate the application key to secure your application:

```bash
php artisan key:generate
```

### 5. Run Database Migrations

Run the migrations to set up your database schema:

```bash
php artisan migrate
```

### 6. Start the Development Server

Start the built-in PHP development server:

```bash
php artisan serve
```

By default, the application will be available at `http://127.0.0.1:8000`.

## Notes

- The development setup bypasses Nginx for simplicity and uses PHP’s built-in development server.
- Ensure your database server is running and accessible from your local machine.
- For issues related to permissions or missing dependencies, ensure the required PHP extensions are installed (e.g., `pdo_mysql`, `zip`, `sockets`).

## Directory Structure

Here’s a brief overview of the project structure:

```
/app
|-- public/        # Publicly accessible files
|-- routes/        # Application routes
|-- resources/     # Views, styles, and frontend assets
|-- database/      # Migrations and seeds
|-- .env.example   # Environment file example
```

## Troubleshooting

If you encounter issues, consider the following steps:

1. Verify all dependencies are installed:

   ```bash
   composer check-platform-reqs
   ```

2. Ensure PHP extensions required by the application are installed.
3. Check your `.env` configuration for database connection errors.

For further assistance, consult the project documentation or contact the development team.