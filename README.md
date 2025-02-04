# Unhandled Exceptions in Dart Asynchronous Network Requests

This repository demonstrates a common error in Dart asynchronous programming:  inadequate exception handling in network requests. The `bug.dart` file shows code vulnerable to unhandled exceptions. The `bugSolution.dart` file provides an improved version with more robust error handling.

## Bug Description

The `fetchData` function in `bug.dart` makes a network request.  While it includes a `try-catch` block, the error handling is insufficient.  The `catch` block only prints the error message to the console, which is not ideal for production apps.  It also rethrows the exception which can be good or bad depending on how the higher layers are handling exceptions.

## Solution

The `bugSolution.dart` file demonstrates a better approach:

*   More informative error messages are provided.
*   The exception type is checked for more specific handling.
*   A custom error class is used for better error representation.