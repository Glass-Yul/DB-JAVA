import java.util.*;

/*
    크기가 10인 배열을 정렬
 */

// <버블소트> => 중복(X)
public class Main {
    public static void main(String[] args){
        HashSet set = new HashSet();
        Integer[] arr;
        Random random = new Random();

        while(true) {
            set.add(random.nextInt(50) + 1); // 1~10 랜덤 => 집합을 이용해 중복 제거
            arr = (Integer[]) set.toArray(new Integer[0]);
            if(arr.length==10) // 집합은 길이를 구할 수 없어 배열로 변환 후 길이 구함
                break;
        }
        
        for(int i=0;i<10;i++)
            System.out.printf("%d ", arr[i]);

        for(int j=0;j<10;j++) {
            for (int i = 0; i < 10 - 1; i++) {
                if (arr[i] > arr[i + 1]) {
                    int tmp = arr[i];
                    arr[i] = arr[i + 1];
                    arr[i + 1] = tmp;
                }
            }
        }
        System.out.println();
        for(int i=0;i<10;i++)
            System.out.printf("%d ", arr[i]);
    }
}


/*
// <버블소트> => 중복(O)
public class Main {
    public static void main(String[] args){
        int[] arr = new int[10];
        Random random = new Random();

        for(int i=0;i<10;i++)
            arr[i] = random.nextInt(11);

        for(int i=0;i<10;i++)
            System.out.printf("%d ", arr[i]);

        for(int j=0;j<10;j++) {
            for (int i = 0; i < 10 - 1; i++) {
                if (arr[i] > arr[i + 1]) {
                    int tmp = arr[i];
                    arr[i] = arr[i + 1];
                    arr[i + 1] = tmp;
                }
            }
        }
        System.out.println();
        for(int i=0;i<10;i++)
            System.out.printf("%d ", arr[i]);
    }
}
 */
