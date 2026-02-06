# Push_swap - Highly Efficient Sorting Algorithm

![Language](https://img.shields.io/badge/Language-C-blue)
![Score](https://img.shields.io/badge/Score-100%2F100-brightgreen)
![Algorithm](https://img.shields.io/badge/Algorithm-Turk_Sort-orange)

## 📊 Overview

**Push_swap** is a 42 Network project that challenges students to sort data on a stack, with a limited set of instructions, using the lowest possible number of actions. To succeed, one must manipulate various sorting algorithms and optimize data processing efficiency.

This implementation achieves the highest possible score using the **Turk Algorithm**, a highly optimized approach for the specific constraints of this project (limited stacks, specific rotation costs).

## 💡 The Algorithm: "Turk Sort"

Instead of traditional algorithms like QuickSort or Radix Sort (which often utilize too many operations for this specific constraint set), I implemented the **Turk Algorithm**.

### Logic Flow
1.  **Push to B:** Move elements from Stack A to Stack B, leaving only 3 elements in A.
2.  **Sort A:** Quickly sort the remaining 3 elements in Stack A.
3.  **Cost Analysis (The Core):** For every element currently in Stack B, the algorithm calculates the exact number of operations (rotations) required to place it in the correct position in Stack A.
4.  **Cheapest Move:** The algorithm identifies the element with the **lowest mechanical cost** and executes the moves to transfer it back to Stack A.
5.  **Final Alignment:** Once all elements are back in A, the stack is rotated to bring the smallest number to the top.

### Data Structure
I utilized **Linked Lists** to manage the stacks. This allows for dynamic memory management and efficient pointer manipulation when swapping or pushing elements between stacks.

## 🚀 Performance

This project requires sorting strictly under a specific number of moves to achieve the maximum score.

| Input Size | Target Moves (Max Score) | My Average Moves | Complexity |
| :--- | :--- | :--- | :--- |
| **3 numbers** | < 3 | **2-3** | $O(1)$ |
| **5 numbers** | < 12 | **10** | $O(1)$ |
| **100 numbers** | < 700 | **~600** | $O(n^2)$ worst case |
| **500 numbers** | < 5500 | **~4800** | $O(n^2)$ worst case |

*Note: While the theoretical complexity of cost calculation is higher, the "Turk" heuristic performs exceptionally well on average cases due to the specific rules of the push_swap operations.*

## 🛠️ Installation & Usage

### 1. Clone and Compile
```bash
git clone https://github.com/lmenoni/Push_Swap_Sorting_Algo.git
cd Push_Swap_Sorting_Algo
make
```
### 2. Running the Program
The program accepts a list of integers as separate arguments.

**Valid Input:**
```bash
./push_swap 42 10 1 50 99
```
3. Error Handling
The program includes rigorous validation to ensure robustness:

  Detects and handles non-numeric arguments.
  Detects and handles integer overflows/underflows.
  Detects duplicates in the input sequence.
  Returns Error on standard error in case of invalid input.

🎨 Visualizer & Automation
I have included a helper script run.sh to automate the compilation and visualization process. This
allows for immediate visual feedback on the sorting logic.

How to run:
```bash
chmod +x run.sh
./run.sh
```

📚 Instruction Set used

| Code | Instruction | Action |
| :--- | :--- | :--- |
| sa | swap a | Swap the first 2 elements at the top of stack a. |
| sb | swap b | Swap the first 2 elements at the top of stack b. |
| ss | swap a + b | sa and sb at the same time. |
| pa | push a | Take the first element at the top of b and put it at the top of a. |
| pb | push b | Take the first element at the top of a and put it at the top of b. |
| ra | rotate a | Shift all elements of stack a up by 1. The first element becomes the last. |
| rb | rotate b | Shift all elements of stack b up by 1. The first element becomes the last. |
| rr | rotate a + b | ra and rb at the same time. |
| rra | reverse rotate a | Shift all elements of stack a down by 1. The last element becomes the first. |
| rrb | reverse rotate b | Shift all elements of stack b down by 1. The last element becomes the first. |
| rrr | reverse rotate a + b | rra and rrb at the same time. |

