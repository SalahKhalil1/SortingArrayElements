<!--Bassim Attia
Rawan Mohammed
Ziad Gamal
Salah Khalil
Moaaz Anwar-->

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