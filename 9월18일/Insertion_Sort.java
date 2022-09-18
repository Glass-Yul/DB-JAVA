import java.util.*;

/*
    크기가 10인 배열을 정렬
 */
// <삽입소트> => 중복(X)
// 1. 전제/부분 집합으로 나눠 진행
// 2. 부분집합 데이터와 전제집합 데이터를 비교함
// 3. (2)내용 반복
public class Main {
    public static void main(String[] args){
        Random random = new Random();
        HashSet set = new HashSet<>();
        Integer[] arr;
        int tmp;

        while(true){
            set.add(random.nextInt(50)+1);
            arr = (Integer[]) set.toArray(new Integer[0]);
            if(arr.length==10) // 집합은 길이를 구할 수 없어 배열로 변환 후 길이 구함
                break;
        }

        for(int i=0;i<10;i++) // 확인
            System.out.printf("%d ", arr[i]);

        for(int i=0;i<9;i++){ // j+1 때문에 i<9로 함 => i<10으로하면 오버플로우임
            int j=i; // 부분집합 부분을 위해 j변수 생성
            while(j>=0 && arr[j]>arr[j+1]){ // 부분집합 정렬
                tmp = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = tmp;
                j--;
            }
        }

        System.out.println();
        for(int i=0;i<10;i++)
            System.out.printf("%d ", arr[i]);

    }
}


// <삽입소트> => 중복(O)
// 1. 전제/부분 집합으로 나눠 진행
// 2. 부분집합 데이터와 전제집합 데이터를 비교함
// 3. (2)내용 반복
//public class Main {
//    public static void main(String[] args){
//        Random random = new Random();
//        int[] arr = new int[10];
//        int tmp;
//
//        for(int i=0;i<10;i++) // U집합에 랜덤 원소 10개 생성
//            arr[i] = random.nextInt(50) + 1;
//
//        for(int i=0;i<10;i++) // 확인
//            System.out.printf("%d ", arr[i]);
//
//        for(int i=0;i<9;i++){ // i<10으로하면 오버플로우임
//            for(int j=i;j>=0;j--){ // i를 기준으로 집합을 나눔
//                if(arr[j]>arr[j+1]){ // 앞/뒤 비교하며 j-- 수행 => 부분집합 정렬
//                    tmp = arr[j];
//                    arr[j] = arr[j+1];
//                    arr[j+1] = tmp;
//                }
//            }
//
//        }
//        System.out.println();
//        for(int i=0;i<10;i++) // 확인
//            System.out.printf("%d ", arr[i]);
//
//    }
//}

