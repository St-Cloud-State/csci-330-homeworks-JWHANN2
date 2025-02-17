#include <iostream>
#include <vector>
#include <stack>
#include <algorithm>

using namespace std;

// Function to partition the array and return the pivot index
int partition(vector<int>& arr, int low, int high) {
    int pivot = arr[high]; // Choose the last element as the pivot
    int i = low - 1;
    for (int j = low; j < high; j++) {
        if (arr[j] < pivot) {
            i++;
            swap(arr[i], arr[j]); // Swap elements to place them correctly
        }
    }
    swap(arr[i + 1], arr[high]); // Place pivot in the correct position
    return i + 1;
}

// Iterative (non-recursive) Quicksort using a stack
void quickSort(vector<int>& arr) {
    stack<pair<int, int>> s;
    s.push({0, arr.size() - 1}); // Push initial indices onto the stack
    
    while (!s.empty()) {
        auto [low, high] = s.top(); // Get the next subarray range
        s.pop();
        
        if (low < high) {
            int pivot = partition(arr, low, high); // Partition the array
            
            // Push the left subarray indices onto the stack
            s.push({low, pivot - 1});
            
            // Push the right subarray indices onto the stack
            s.push({pivot + 1, high});
        }
    }
}

// Main function to demonstrate quicksort
int main() {
    vector<int> arr = {10, 7, 8, 9, 1, 5};
    quickSort(arr);
    
    // Print the sorted array
    cout << "Sorted array: ";
    for (int num : arr) cout << num << " ";
    cout << endl;
    
    return 0;
}
