import java.util.*;

/*
    크기가 10인 배열을 정렬
 */
// <선택소트> => 중복(X)
// 1. 최소값/인덱스 찾기
// 2. 최소값 자리와 i번째 자리 체인지
// 3. 위 내용 반복
public class Main {
    public static void main(String[] args){
        HashSet set = new HashSet();
        Integer[] arr;
        Random random = new Random();
        int min, tmp, key=0;

        while(true) { // 중복없이 랜덤 숫자 10개 추출
            set.add(random.nextInt(50) + 1); // 1~50 랜덤 => 집합을 이용해 중복 제거
            arr = (Integer[]) set.toArray(new Integer[0]);
            if(arr.length==10) // 집합은 길이를 구할 수 없어 배열로 변환 후 길이 구함
                break;
        }

        for(int i=0;i<10;i++) // 확인
            System.out.printf("%d ", arr[i]);

        for(int i=0;i<10;i++){
            min=999;
            for(int j=i;j<10;j++){
                if(min>arr[j]){
                    min=arr[j];
                    key=j;
                }
            }
            tmp=arr[i]; // 최소값이 있었던 자리값을 대피시킴
            arr[i]=arr[key]; // 대피시킨 자리에 min값을 줌
            arr[key]=tmp; // 최소값이 있었던 자리에 arr[i]값을 줌
        }

        System.out.println();
        for(int i=0;i<10;i++) // 확인
            System.out.printf("%d ", arr[i]);
    }
}



// <선택소트> => 중복(O)
// 1. 최소값/인덱스 찾기
// 2. 최소값 자리와 i번째 자리 체인지
// 3. 위 내용 반복
//public class Main {
//    public static void main(String[] args){
//        int[] arr = new int[10];
//        Random random = new Random();
//        int min, tmp, key=0;
//
//        for(int i=0;i<10;i++) // 배열에 랜덤감 10개 준다.
//            arr[i] = random.nextInt(50)+1;
//
//        for(int i=0;i<10;i++) // 확인
//            System.out.printf("%d ", arr[i]);
//
//
//        for(int i=0;i<10;i++){
//            min = 999;
//            for(int j=i;j<10;j++){ // 최솟값/인덱스 찾기
//                if(min>arr[j]) {
//                    min = arr[j]; // 최소값
//                    key = j; // 해당 인덱스
//                }
//            }
//            tmp = arr[i];
//            arr[i] = arr[key];
//            arr[key] = tmp;
//        }
//
//        System.out.println();
//        for(int i=0;i<10;i++) // 확인
//            System.out.printf("%d ", arr[i]);
//    }
//}

