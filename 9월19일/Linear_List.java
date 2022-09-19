import java.util.*;
/*
 이미 정렬된 정적배열임 && 한 번만 수행
 */
// 선형리스트 삽입
// 원하는 곳에 삽입
// 삽입 자리 선택 후 해당 공간 비우기 => 옆으로 이동

public class Main {
    static int insertElement(int[] arr, int size, int num) { // 배열, 현재 실제 저장된 길이, 삽입값
        int i, k=0, move=0;
        for(i=0;i<size;i++){
            if(arr[i]<=num && num<=arr[i+1]){ // 입력한 숫자가 해당 배열 사이값이면
                k=i+1; // 해당 숫자를 저장할 인덱스를 k에 대입 => i+1인 이유는 사이 값이니 i 다음자리에 삽입해야됨
                break;
            }
        }
        if(i==size) {  // 삽입 원소가 현재 저장된 원소보다 큰 숫자이면
            arr[i]=num;
            return 0;
        }
        for(i=size;i>k;i--){ // 한 칸씩 이동
            arr[i]=arr[i-1];
            move++;
        }

        arr[k]=num; // 자리 이동으로 만든 인덱스에 입력한 숫자 삽입

        return move;
    }

    static int deleteElement(int[] arr, int size, int num) {
        int i, k=0, move=0;

        for(i=0;i<size;i++){
            if(arr[i]==num){ // 해당 위치의 값이 입력한 값과 같으면
                k=i; // k에 인덱스 저장
                break;
            }
        }
        if(i==size) move=size; // 맨 뒤 인덱스이면

        for(i=k;i<size;i++){ // 같은 원소값이였던 위치에서부터 현재 들어있는 숫자 인덱스만큼
            arr[i]=arr[i+1]; // 자리 이동 => 삭제할 원소 인덱스에 자리 이동으로 다른 숫자가 채워지므로 삭제된거와 같은 의미를 가짐
            move++;
        }

        return move;
    }

    static void sort(int[] arr, int size){
        for(int i=0;i<size;i++)
            System.out.printf("%d ", arr[i]);
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int[] arr = new int[10];
        int move, size = 0; // 현재 배열 안 원소 개수
        int num; // 원소 입력


        System.out.println("<삽입 전 리스트>");
        for(int i=10;i<=80;i+=10){
            if(i==30) // 인위적으로 30을 뺌 -> 테스트 때 집어넣을 거임
                continue;
            arr[size]=i;
            size++;
        }

        sort(arr, size); // 확인

        System.out.printf("\n현재 원소의 개수 : %d", size);

        System.out.printf("\n삽입하고 싶은 원소 입력(0은 제외) : ");
        num = sc.nextInt();
        move = insertElement(arr, size, num);

        System.out.println("\n<삽입 후 리스트>");
        sort(arr, ++size); // 확인
        System.out.printf("\n현재 원소의 개수 : %d", size);
        System.out.printf("\n삽입 시 이동 횟수 : %d", move);

        System.out.printf("\n삭제하고 싶은 원소 입력 : ");
        num = sc.nextInt();
        move = deleteElement(arr, size, num);

        System.out.println("\n<삭제 후 리스트>");
        sort(arr, --size); // 확인
        System.out.printf("\n현재 원소의 개수 : %d", size);
        System.out.printf("\n삭제 시 이동 횟수 : %d", move);

    }

}
