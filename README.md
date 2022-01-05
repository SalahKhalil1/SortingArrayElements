<!--Bassim Attia
Rawan Mohammed
Ziad Gamal
Salah Khalil
Moaaz Anwar-->



# Sorting Array Elements
## About The Project
*This is a Sorting program that Sorts the integer Values of an array that entered by the user 
and print them in either*
1. Ascending Order Sort
2. Descending Order Sort
3. In Both of them

*Using one of these three Sorting Algorithms:*
1. Insertion Sort
2. Selection Sort
3. Bubble Sort

## Sorting Algorithms
### 1. Insertion Sort 

*   *In This Sorting Technique of the Array Elements assuming ascending order technique we Select the first unsorted element then swapping other elements to the right to create the correct position and shift the unsorted element then we advance to select the next one and repeat this again until the whole array is sorted.*


* **_For Example :_**

![i1](https://user-images.githubusercontent.com/47761503/148007906-2e9e987e-635e-4888-8c17-b017cb5035e2.PNG)
![i2](https://user-images.githubusercontent.com/47761503/148007911-2bad673b-f755-4520-bffa-59f4e615d36f.PNG)
![i3](https://user-images.githubusercontent.com/47761503/148007913-a9ec273d-658e-4fb1-be69-5f74e7b5a2fb.PNG)
![i4](https://user-images.githubusercontent.com/47761503/148007914-641eabde-3408-42f4-8c90-3d5783cf0e8b.PNG)
![i5](https://user-images.githubusercontent.com/47761503/148007919-5a2d96c5-1d4e-4a8c-9470-f2172e88efdb.PNG)
![i6](https://user-images.githubusercontent.com/47761503/148007920-02e106eb-a4ef-4592-918e-a9fdac42a86a.PNG)
![i7](https://user-images.githubusercontent.com/47761503/148007922-084cb7a8-855a-416d-9272-7a95b1728917.PNG)
---
 <mark> *This Process is performed n-1 times where n is the Array Size until it is finally sorted* </mark>
    
![i8](https://user-images.githubusercontent.com/47761503/148007905-de837187-0d55-40ca-b745-930ac06fe01b.PNG)

*  **_Time Complexity:_**
    
     O(n<sup>2</sup>)
     
 * **C++ Code :**
 
```
// C++ Insertion Sort Code

	int arrsize = sizeof(array) / sizeof(array[0]);

	for (int i = 1; i < arrsize; i++)
	{
		int currentValue = array[i];
		int j;
		for ( j = i; j > 0 && currentValue <= array[j - 1]; j--)
		{
			array[j] = array[j - 1];
		}
		array[j] = currentValue;

```

***


### 2. Selection Sort 

*   *In This Sorting Technique of the Array Elements assuming ascending order technique we are iterating over the array elements that are unsorted to find the maximum one and swapping it at the end with last unsorted one and repeat this again until the whole array is sorted.*


* **_For Example :_**

![selectionsortnew](https://user-images.githubusercontent.com/47761503/147995391-86e05f72-c24f-4dfd-a00a-4b119f74577c.png)

*  **_Time Complexity:_**
    
     O(n<sup>2</sup>)
     
 * **C++ Code :**


```
// C++ Selection Sort Code
	int arrsize = sizeof(array) / sizeof(array[0]);
	for (int i = arrsize - 1; i > 0; i--)
	{
		int MaxIndex = i;
		for (int j = i - 1; j >= 0; j--)
		{
			if (array[i] > array[MaxIndex])
			{
				MaxIndex = i;
			}
		}
		swap(MaxIndex, i);
	}

```
***

### 3. Bubble Sort

*   *This is a Sorting Technique that compares two adjacent elements and swaps them until they are not in the intended order until the whole array is sorted.*


* **_For Example :_**

![bubble sort](https://user-images.githubusercontent.com/47761503/148011706-3e334a1e-9e12-4ec8-ab23-a7effd0445c9.png)


*  **_Time Complexity:_**
    
     O(n<sup>2</sup>)
     
 * **C++ Code :**
 ```
	// C++ Bubble Sort Code

		int arrsize = sizeof(array) / sizeof(array[0]);

		for (int i = 0; i < arrsize - 1; i++)
		{
			for (int j = 0; j < arrsize - i - 1; j++)
			{
				if (array[j] > array[j + 1])
				{
					int temperary = array[j];
					array[j] = array[j + 1];
					array[j + 1] = temperary;
				}
			}
		}

```
***