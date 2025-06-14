#!/bin/bash

# Test Backend
echo "Testing Backend..."
if curl -sf http://localhost:3000/todos > /dev/null; then
  echo "✅ Backend is running."
else
  echo "❌ Backend is not running."
fi

# Test Frontend
echo "Testing Frontend..."
if curl -sf http://localhost:80 > /dev/null; then
  echo "✅ Frontend is running."
else
  echo "❌ Frontend is not running."
fi

# Test MongoDB
echo "Testing MongoDB..."
if nc -zv localhost 27017 > /dev/null 2>&1; then
  echo "✅ MongoDB is running."
else
  echo "❌ MongoDB is not running."
fi

echo "All tests completed."
         