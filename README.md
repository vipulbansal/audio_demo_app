# audio_demo_app

An Audio recording demo app.

## Overview

This project involves building a minimal Flutter mobile application that allows users to record, store, list, and play audio notes offline. The app will have a clean and maintainable architecture with scalability in mind, ensuring readiness for future features like tagging, cloud syncing, and AI-based organization.

## Key Features

1. Record audio offline.
2. Save recordings locally with a unique ID (editable by the user).
3. List all stored recordings.
4. Playback audio recordings.
5. Handle errors.

## Architecture

The project follows MVVM Architecture (Model-View-ViewModel) with:
1. Separation of concerns (UI, business logic, and data storage).
2. State management with Provider.
3. Repository pattern for handling offline-first audio storage.

## Trade-offs

1. Limited External Dependencies.
2. Local Storage Instead of Cloud.
3. Simple UI.
4. No Background Recording.

## Scope for Future Enhancements

1. Cloud Syncing.
2. Background Recording Support.
3. Waveform Visualization.
