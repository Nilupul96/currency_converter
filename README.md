# Currency Converter App

This is a Flutter application for converting currencies using real-time exchange rates. The project is structured using the Clean Architecture pattern to ensure a scalable and maintainable codebase.

## Table of Contents

- [Features](#features)
- [ScreenShots](#Screenshots)
- [Architecture](#architecture)
- [Setup](#setup)
- [Running the App](#running-the-app)
- [Dependencies](#dependencies)


## Features

- Convert currencies using up-to-date exchange rates.
- Select from a wide range of currencies.
- Save selected currencies locally for quick access.

## Screenshots
![alt text](<currency converter.png>)

## Architecture

This project follows the Clean Architecture pattern, which divides the codebase into several layers:

1. **Presentation**: Contains the UI code (Widgets) and the logic to handle user interactions.
2. **Domain**: Contains the business logic. This includes use cases and entities.
3. **Data**: Handles data retrieval from various sources (e.g., APIs, local storage). This layer includes repositories and data sources.

### Layers

- **Presentation Layer**:
  - Widgets: Flutter widgets for UI.
  - Bloc: Business Logic Component for state management.
  
- **Domain Layer**:
  - Entities: Basic data objects used across the application.
  - Use Cases: Classes that contain the business logic.

- **Data Layer**:
  - Repositories: Interfaces for data handling.
  - Data Sources: Implementations for data fetching (e.g., API calls, local storage).

## Setup

To set up the project locally, follow these steps:

1. **Clone the repository**:

   ```bash
   git clone https://github.com/Nilupul96/currency_converter.git
   cd currency_converter

2. **Install Flutter**:

If you haven't already, install Flutter by following the instructions on the official Flutter website.

3. **Get dependencies**:

flutter pub get

4. **Running the App**:

Run on an emulator or connected device:

flutter run

## Dependencies
Here are some of the key dependencies used in this project:

Currency converting API - https://app.freecurrencyapi.com