// import 'dart:io';

// void main() {
//   insertValue(10);
//   insertValue(8);
//   insertValue(12);
//   insertValue(4);
//   insertValue(9);
//   inOrder();
//   // print('');
//   // preOrder();
//   // print('');
//   // postOrder();
//   // print(search(12));
// }

// class Node {
//   int data;
//   Node? left;
//   Node? right;
//   Node(this.data);
// }

// Node? root;
// void insertValue(int data) {
//   Node? currentValue = root;
//   if (currentValue == null) {
//     root = Node(data);
//     return;
//   }
//   while (true) {
//     if (data < currentValue!.data) {
//       if (currentValue.left == null) {
//         currentValue.left = Node(data);
//         break;
//       } else {
//         currentValue = currentValue.left;
//       }
//     } else {
//       if (currentValue.right == null) {
//         currentValue.right = Node(data);
//         break;
//       } else {
//         currentValue = currentValue.right;
//       }
//     }
//   }
// }

// bool search(int data) {
//   Node? currentValue = root;
//   while (currentValue != null) {
//     if (data < currentValue.data) {
//       currentValue = currentValue.left;
//     } else if (data > currentValue.data) {
//       currentValue = currentValue.right;
//     } else {
//       return true;
//     }
//   }
//   return false;
// }

// void remove(int data) {
//   removeHelper(data, root, null);
// }

// void removeHelper(int data, Node? currentNode, Node? parentNode) {
//   while (currentNode != null) {
//     if (data < currentNode.data) {
//       parentNode = currentNode;
//       currentNode = currentNode.left;
//     } else if (data > currentNode.data) {
//       parentNode = currentNode;
//       currentNode = currentNode.right;
//     } else {
//       if (currentNode.left != null && currentNode.right != null) {
//         currentNode.data = getMinimumValue(currentNode.right);
//         removeHelper(currentNode.data, currentNode.right, currentNode);
//       } else {
//         if (parentNode == null) {
//           if (parentNode!.left == null) {
//             root = currentNode.left;
//           } else {
//             root = currentNode.right;
//           }
//         } else {
//           if (parentNode.left == currentNode) {
//             if (currentNode.right == null) {
//               parentNode.left = currentNode.left;
//             } else {
//               parentNode.left = currentNode.right;
//             }
//           } else {
//             if (currentNode.right == null) {
//               parentNode.right = currentNode.left;
//             } else {
//               parentNode.right = currentNode.right;
//             }
//           }
//         }
//       }
//       break;
//     }
//   }
// }

// int getMinimumValue(Node? currentNode) {
//   if (currentNode!.left == null) {
//     return currentNode.data;
//   } else {
//     return getMinimumValue(currentNode.left);
//   }
// }

// void inOrder() {
//   inOrderHelper(root);
// }

// void inOrderHelper(Node? root) {
//   if (root != null) {
//     inOrderHelper(root.left);
//     stdout.write('${root.data} ');
//     inOrderHelper(root.right);
//   }
// }

// void preOrder() {
//   preOrderHelper(root);
// }
// void preOrderHelper(Node? root) {
//   if (root != null) {
//     stdout.write('${root.data} ');
//     preOrderHelper(root.left);
//     preOrderHelper(root.right);
//   }
// }

// void postOrder() {
//   postOrderHelper(root);
// }
// void postOrderHelper(Node? root) {
//   if (root != null) {
//     postOrderHelper(root.left);
//     postOrderHelper(root.right);
//     stdout.write('${root.data} ');
//   }
// }

// // Graph
// class Graph {
//   Map<int, List> graph = {};
//   void insertValue(int vertex, int edge, bool isBidirectional) {
//     if (!graph.containsKey(vertex)) {
//       addVertex(vertex);
//     }
//     if (!graph.containsKey(edge)) {
//       addVertex(edge);
//     }
//     graph[vertex]?.add(edge);
//     if (isBidirectional) {
//       graph[edge]?.add(vertex);
//     }
//   }

//   void addVertex(int data) {
//     graph.putIfAbsent(data, () => []);
//   }

//   void display() {
//     graph.forEach((key, value) {
//       print({key, value});
//     });
//   }

//   bfs(int vertex) {
//     if (!graph.containsKey(vertex)) {
//       print('not found');
//       return;
//     }
//     Set<int> visited = {};
//     List<int> queue = [];
//     visited.add(vertex);
//     queue.add(vertex);
//     while (queue.isNotEmpty) {
//       int current = queue.removeAt(0);
//       print(current);
//       for (int i in graph[current]!) {
//         if (!visited.contains(i)) {
//           visited.add(i);
//           queue.add(i);
//         }
//       }
//     }
//   }

//   dfs(int vertex) {
//     if (!graph.containsKey(vertex)) {
//       print('Not found');
//     } else {
//       Set<int> visited = {};
//       dfshelper(vertex, visited);
//       print(visited);
//     }
//   }

//   void dfshelper(int vertex, Set<int> visited) {
//     visited.add(vertex);
//     for (int i in graph[vertex]!) {
//       if(!visited.contains(i)){
//         dfshelper(i, visited);
//       }     
//     }
//   }
// }

// void main() {
//   Graph graph = Graph();
//   graph.insertValue(20, 10, false);
//   graph.insertValue(15, 20, false);
//   graph.insertValue(20, 25, false);
//   graph.dfs(30);
//   graph.display();
// }


// // heap
// void main() {
//   List<int> array = [6,2,8,10];
//   MinHeap minHeap = MinHeap(array);
//   minHeap.insert(1);
//   minHeap.insert(5);
//   minHeap.insert(15);
//   minHeap.removeValue();
//   minHeap.display();
//   print(minHeap.peek());
// }

// class MinHeap {
//   List<int> array = [];
//   MinHeap(this.array) {
//     buildHeap(array);
//   }

//   void display(){
//     print(array);
//   }

//   void buildHeap(List array) {
//    for(int i=parent(array.length-1);i>=0;i--){
//       shiftDown(i,array);
//    }
//   }

//   void shiftDown(int currentIndex,List array){
//     int endIndex=array.length-1;
//     int leftIndex=leftChild(currentIndex);
//     while(leftIndex<=endIndex){
//       int rightIndex=rightChild(currentIndex);
//       int indexToShift;
//       if(rightIndex<=endIndex&&array[rightIndex]<array[leftIndex]){
//         indexToShift=rightIndex;
//       }else{
//         indexToShift=leftIndex;
//       }
//       if( array[currentIndex] > array[indexToShift]){
//         swap(array, indexToShift, currentIndex);
//         currentIndex=indexToShift;
//         leftIndex=leftChild(currentIndex);
//       }else{
//         return;
//       }
//     }
//   }

//   void insert(int value){
//     array.add(value);
//     shiftUp(array.length-1);
//   }

//   void shiftUp(int currentIndex){
//     int parentIndex=parent(currentIndex);
//     while(currentIndex>0&&array[parentIndex]>array[currentIndex]){
//       swap(array, currentIndex, parentIndex);
//       currentIndex=parentIndex;
//       parentIndex=parent(currentIndex);
//     }
//   }

//   int peek(){
//     return array[0];
//   }

//   void removeValue(){
//     swap(array, 0, array.length-1);
//     int removeIndex=array.length-1;
//     array.remove(array[removeIndex]);
//     shiftDown(0, array);
//   }

//   void swap(List array,int i, int j){
//     int temp=array[i];
//     array[i]=array[j];
//     array[j]=temp;
//   }

//   int parent(int i) {
//     return (i - 1) ~/ 2;
//   }

//   int leftChild(int i) {
//     return (2 * i) + 1;
//   }

//   int rightChild(int i) {
//     return (2 * i) + 2;
//   }
// }


// // trie
// class TrieNode {
//   Map<String, TrieNode> children = {};
// }

// TrieNode root = TrieNode();
// String end='*';

// void populateSufixTrie(String str) {
//   for (int i = 0; i < str.length ; i++) {
//     insertSubstringStartingAt(i, str);
//   }
// }

// void insertSubstringStartingAt(int start, String str) {
//   TrieNode node = root;
//   for (int i = start; i < str.length; i++) {
//     String letter = str[i];
//     if (!node.children.containsKey(letter)) {
//       TrieNode newNode = TrieNode();
//       node.children[letter] = newNode;
//     }
//     node = node.children[letter]!;
//   }
//   node.children[end]=TrieNode();
// }

// bool search(String str) {
//   TrieNode node = root;
//   for (int i = 0; i < str.length; i++) {
//     String letter = str[i];
//     if (!node.children.containsKey(letter)) {
//       return false;
//     }
//     node = node.children[letter]!;
//   }
//   return node.children.containsKey(end);
// }

// void main(){
//   populateSufixTrie('mannan');
//   print(search('nan'));
// }


// // Linked List
// class Node {
//   int? data;
//   Node? next;
//   Node(int data) {
//     this.data = data;
//     this.next = null;
//   }
// }

// class LinkedList {
//   Node? head;
//   Node? tail;
//   void addData(int data) {
//     Node newData = Node(data);
//     if (head == null) {
//       head = newData;
//       tail = newData;
//       return;
//     } else {
//       tail!.next = newData;
//       tail = newData;
//     }
//   }

//   printData() {
//     if (head == null) {
//       print("no data");
//       return;
//     }
//     Node? current = head;
//     while (current != null) {
//       print('${current.data}');
//       current = current.next;
//     }
//   }

//   void deleteData(int data) {
//     Node? prev = null;
//     Node? temp = head;
//     if (head == null) {
//       return;
//     }
//     //deleting head & updating new head
//     if (temp!.data == data) {
//       head = temp.next;
//       return;
//     }
//     while (temp != null && temp.data != data) {
//       prev = temp;
//       temp = temp.next;
//     }
//     // no delete element found
//     if (temp == null) {
//       return;
//     }

//     if (temp == tail) {
//       tail = prev;
//       tail!.next = null;
//       return;
//     }
//     // deleting in between element
//     prev!.next = temp.next;
//   }

//   // inserting an element after one number
//   void inserAt(int inserAfter, int data) {
//     //value stored in new node
//     Node newNode = Node(data);
//     Node? temp = head;
//     while (temp != null && temp.data != inserAfter) {
//       temp = temp.next;
//     }
//     //no inserAfter element found
//     if (temp == null) {
//       return;
//     }

//     if (temp == tail) {
//       tail!.next = newNode;
//       tail = newNode;
//       return;
//     }
//     //inserting inbetween 2 elements
//     newNode.next = temp.next;
//     temp.next = newNode;
//   }

//    arrayToLinkedList(List<int> array) {
//     for (int i = 0; i < array.length; i++) {
//       Node? newNode = Node(array[i]);
//       if (i == 0 && head == null) {
//         head = newNode;
//         tail = newNode;
//       } else {
//         tail!.next = newNode;
//         tail = newNode;
//       }
//     }
//   }

// //deleting duplicates in sorted linkedlist
//   void deleteDuplicates() {
//     Node? current = head;
//     if (current == null) {
//       return;
//     }
//     Node? check = head!.next;
//     if (check == null) {
//       return;
//     }

//     while (check != null && current != null) {
//       if (check.data == current.data) {
//         check = check.next;
//         current.next = check;
//       } else {
//         check = check.next;
//         current = current.next;
//       }
//     }
//     tail = current;
//     print("tail ${tail!.data}");
//     if (check == null) {
//       return;
//     }
//   }

  
// }

// void main(List<String> args) {
//   LinkedList link = LinkedList();

//   link.addData(4);
//   link.addData(4);
//   link.addData(6);
//   link.addData(7);
//   link.addData(8);
//   link.addData(8);
//   link.addData(9);

//   link.deleteDuplicates();
//   link.deleteData(7);
//   link.inserAt(8, 400);

//   link.printData();
// }


// // Doubly LinkedList
// class Node {
//   int? data;
//   Node? next;
//   Node? prev;
//   Node(int data) {
//     this.data = data;
//   }
// }

// class LinkedList {
//   Node? head;
//   Node? tail;
//   void addData(int data) {
//     Node newNode = Node(data);
//     if (head == null) {
//       head = newNode;
//       tail = newNode;
//     } else {
//       newNode.prev = tail;
//       tail!.next = newNode;
//       tail = newNode;
//     }
//   }

//   void displayData() {
//     Node? temp = head;
//     if (temp == null) {
//       print("no data");
//     }
//     while (temp != null) {
//       print("${temp.data}");
//       temp = temp.next;
//     }
//   }

//   void displayReverse() {
//     Node? temp = tail;

//     while (temp != null) {
//       print("${temp.data}");
//       temp = temp.prev;
//     }
//   }

//   void delete(int data) {
//     Node? temp = head;
//     if (temp == null) {
//       return;
//     }
//     if (temp.data == data) {
//       if (head!.next != null) {
//         head = temp.next;
//         head!.prev = null;
//       } else {
//         head = null;
//       }

//       return;
//     }
//     while (temp != null && temp.data != data) {
//       temp = temp.next;
//     }
//     if (temp == null) {
//       return;
//     }
//     if (temp == tail) {
//       tail = temp.prev;
//       tail!.next = null;
//       return;
//     }
//     Node? before = temp.prev;

//     Node? after = temp.next;
//     after!.prev = before;
//     before!.next = after;
//   }

//   void InsertingAfter(int after, int data) {
//     Node? temp = head;
//     Node newNode = Node(data);
//     if (temp == null) {
//       return;
//     }
//     while (temp != null && temp.data != after) {
//       temp = temp.next;
//     }
//     if (temp == null) {
//       return;
//     }
//     if (temp == tail) {
//       Node? tempor = tail;
//       tail!.next = newNode;
//       tail = newNode;
//       tail!.prev = tempor;
//       tail!.next = null;
//       return;
//     }
//     Node? aft = temp.next;
//     temp.next = newNode;
//     newNode.prev = temp;
//     newNode.next = aft;
//     aft!.prev = newNode;
//   }

//   void insertingBefore(int before, int data) {
//     Node? newNode = Node(data);
//     Node? temp = head;
//     if (temp == null) {
//       return;
//     }
//     if (temp.data == before) {
//       Node? tempor = head;
//       head = newNode;
//       tempor!.prev = head;
//       head!.next = tempor;
//       head!.prev = null;
//       return;
//     }
//     while (temp != null && temp.data != before) {
//       temp = temp.next;
//     }
//     if (temp == null) {
//       return;
//     }
//     Node? bef = temp.prev;
//     temp.prev = newNode;
//     newNode.next = temp;
//     newNode.prev = bef;
//     bef!.next = newNode;
//   }
// }

// void main(List<String> args) {
//   LinkedList list = LinkedList();
//   list.addData(5);
//   list.addData(7);
//   list.addData(9);
//   list.addData(13);
//   list.addData(1);

//   list.insertingBefore(9, 100);
//   list.InsertingAfter(100, 1000);
//   list.displayData();
// }


// // Binary search
// void main() {
//   print(binary([1, 2, 3, 4, 5, 6, 7, 8, 9], 5));
// }

// //only works for sorted array 
// int binary(List<int> array, int target) {
//   int start = 0;
//   int end = array.length - 1;
//   while (start <= end) {
//     int middle = start + (end - start) ~/ 2;
//     if (array[middle] == target) {
//       return middle;
//     } else if (array[middle] < target) {
//       start = middle + 1;
//     } else if (array[middle] > target) {
//       end = middle - 1;
//     }
//   }
//   return -1;
// }


// // Linear Search
// void main(List<String> args) {
//   List<int> array = [3, 2, 5, 6, 4, 1];
//   print(position(array, 5));
// }

// int position(List<int> arr, int target) {
//   for (int i = 0; i < arr.length; i++) {
//     if (arr[i] == target) {
//       return i;
//     }
//   }
//   return -1;
// }


// // Recursion
// void main(List<String> args) {
//   int num = 5;
//   int n = factorial(num);
//   print("factorial of $num is $n");
// }

// int factorial(int n) {
//   if (n <= 1) {
//     return 1;
//   }
//   return n * factorial(n - 1);
// }


// Sorting

// Bubble
// void main(List<String> args) {
//   sort([5, 4, 33, 100, 3, 5, 9, 2]);
// }

// sort(List<int> array) {
//   int count = array.length;
//   for (var i = 0; i < array.length ; i++) {
//     for (var j = 0; j < count - 1; j++) {
//       int small = j;
//       int large = j + 1;
//       if (array[small] > array[large]) {
//         int temp = array[small];
//         array[small] = array[large];
//         array[large] = temp;
//       }
//     }
//     count--;
//   }
//   print(array);
// }


// // InssertionSort
// void main(List<String> args) {
//   insertionSort([90, 5, 32, 1, 5, 64, 3]);
  
// }

// insertionSort(List<int> array) {
//   for (var i = 1; i < array.length; i++) {
//     int temp = array[i];
//     int j = i - 1;
//     while (j >= 0 && array[j] > temp) {
//       array[j + 1] = array[j];
//       j--;
//     }
//     array[j + 1] = temp;
//   }
//   print(array);
// }


// // Selection
// void main(List<String> args) {
//   selectionSort([5, 43, 2, 33, 5, 1, 100, 3, 4]);
// }

// selectionSort(List<int> array) {
//   for (var i = 0; i < array.length; i++) {
//     int small = array[i];
//     int pos = i;
//     for (var j = i+1; j < array.length; j++) {
//       if (array[j] < small) {
//         small = array[j];
//         pos = j;
//       }
//     }
//     int temp = array[i];
//     array[i] = small;
//     array[pos] = temp;
//   }
//   print(array);
// }


// // QuickSort
// void main(List<String> args) {
//   quickSort([5, 43, 2, 33, 5, 1, 100, 3, 4]);
// }

// quickSort(List<int> array) {
//   quickSortHelper(array, 0, array.length - 1);
//   print(array);
// }

// quickSortHelper(List<int> array, int startIndex, int endIndex) {
//   if (startIndex >= endIndex) {
//     return;
//   }
//   int pivotIndex = startIndex;
//   int leftIndex = startIndex + 1;
//   int rightIndex = endIndex;
//   while (leftIndex <= rightIndex) {
//     if (array[leftIndex] >= array[pivotIndex] &&
//         array[rightIndex] <= array[pivotIndex]) {
//       swap(array, leftIndex, rightIndex);
//       leftIndex++;
//       rightIndex--;
//     }
//     if (array[leftIndex] < array[pivotIndex]) {
//       leftIndex++;
//     }
//     if (array[rightIndex] > array[pivotIndex]) {
//       rightIndex--;
//     }
//   }
//   swap(array, rightIndex, pivotIndex);
//   quickSortHelper(array, startIndex, rightIndex - 1);
//   quickSortHelper(array, rightIndex + 1, endIndex);
// }

// swap(List<int> array, int i, int j) {
//   int temp = array[i];
//   array[i] = array[j];
//   array[j] = temp;
// }


// // MergeSort
// void main(List<String> args) {
//   List<int> sortedArray = mergeSort([90, 5, 32, 1, 5, 64, 3]);
//   print(sortedArray);
// }

// List<int> mergeSort(List<int> array) {
//   if (array.length <= 1) {
//     return array;
//   }
//   int middleIndex = array.length ~/ 2;
//   List<int> firstHalf = array.sublist(0, middleIndex);
//   List<int> secondHalf = array.sublist(middleIndex);
//   return join(mergeSort(firstHalf), mergeSort(secondHalf));
// }

// List<int> join(List<int> firstHalf, List<int> secondHalf) {
//   int i = 0;
//   int j = 0;

//   List<int> array = [];
//   while (i < firstHalf.length && j < secondHalf.length) {
//     if (firstHalf[i] < secondHalf[j]) {
//       array.add(firstHalf[i++]);
   
//     } else {
//       array.add(secondHalf[j++]);
     
//     }
//   }
//   while (i < firstHalf.length) {
//     array.add(firstHalf[i++]);
 
//   }
//   while (j < secondHalf.length) {
//     array.add(secondHalf[j++]);
  
//   }
//   return array;
// }


// // Stack
// import 'dart:io';

// class Node {
//   int? data;
//   Node? next;
//   Node(int data) {
//     this.data = data;
//   }
// }

// class Stack {
//   Node? top;
//   push(int data) {
//     Node newNode = Node(data);
//     if (top == null) {
//       top = newNode;
//     } else {
//       newNode.next = top;
//       top = newNode;
//     }
//   }

//   display() {
//     Node? temp = top;
//     while (temp != null) {
//       stdout.write("${temp.data} " "");
//       temp = temp.next;
//     }
//   }

//   pop() {
//     if (top == null) {
//       print("stack underflow");
//       return;
//     }
//     top = top!.next;
//   }
// }

// void main(List<String> args) {
//   Stack stack = Stack();
//   stack.push(2);
//   stack.push(9);
//   stack.push(32);
//   stack.pop();

//   stack.display();
// }


// // Queue
// class Node {
//   int? data;
//   Node? next;
//   Node(int data) {
//     this.data = data;
//   }
// }

// class Queue {
//   Node? front;
//   Node? rear;
//   enqueue(int data) {
//     Node newNode = Node(data);
//     if (rear == null) {
//       front = rear = newNode;
//     } else {
//       rear!.next = newNode;
//       rear = newNode;
//     }
//   }

//   dequeue() {
//     if (front == null) {
//       return;
//     } else {
//       front = front!.next;
//     }
//   }

//   printData() {
//     Node? temp = front;
//     if (temp == null) {
//       rear = null;
//       print("queue is empty");
//     }
//     while (temp != null) {
//       print("${temp.data}" "");
//       temp = temp.next;
//     }
//   }
// }

// void main(List<String> args) {
//   Queue queue = Queue();
//   queue.enqueue(12);
//   queue.enqueue(34);
//   queue.enqueue(550);
//   queue.dequeue();
//   queue.dequeue();
//   queue.dequeue();
//   queue.printData();
// }


// HashTable
// class HashTable {
//   List<List<int>> table;
//   late int size;

//   HashTable(int size) : table = List.generate(size, (index) => []) {
//     this.size = size;
//   }

//   int hashFunction(dynamic key) {
//     return key.hashCode.abs() % size;
//   }

//   void insert(dynamic key, int value) {
//     int index = hashFunction(key);
//     table[index].add(value);
//   }

//   List<int> search(dynamic key) {
//     int index = hashFunction(key);
//     return table[index];
//   }

//   void remove(dynamic key, int value) {
//     int index = hashFunction(key);
//     table[index].remove(value);
//   }

//   void displayall() {
//     for (int i = 0; i < size; i++) {
//       List<int> temp = table[i];
//       print(temp);
//     }
//   }
// }

// void main() {
//   HashTable hashtable = HashTable(10);

//   hashtable.insert("apple", 1);
//   hashtable.insert("banana", 2);
//   hashtable.insert("orange", 3);

//   print(hashtable.search("apple"));
//   print(hashtable.search("banana"));
//   print(hashtable.search(2));

//   hashtable.remove("apple", 1);
//   print(hashtable.search("apple"));
//   // Output: []
//   hashtable.displayall();
// }