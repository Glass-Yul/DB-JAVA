import java.util.*;

/*
한 번에 결정하는 다수결 가위바위보 구하기
 */

public class RSP {
    public static void main(String[] args){
         final int N = 100;
         int cnt = 0;

         for(int rock=0;rock<=100;rock++){ // 총 100명 중 바위를 낸 사람
             for(int scissors=0;scissors<=N-scissors;scissors++){ // 총 100명 중 바위를 낸 사람을 뺀 가위를 낸 사람
                 int paper = N-rock-scissors; // 두 경우에 수를 뺀 나머지 값이 보를 낸 사람

                 if(rock>scissors){ // 바위가 가위보다 많을 때
                     if(rock!=paper) // 바위와 보에 숫자가 같지 않을 때
                         cnt++; // 그럼 바위와 보 중 한 숫자가 크거나 작은 상태이므로 결정됨
                 } else if(rock<scissors){
                     if(scissors!=paper)
                         cnt++;
                 } else {
                     if(rock<paper) // 바위가 보 보다 작을 수이면
                        cnt++; // 바위와 가위가 같은 수이기 때문에 바위보다 보가 더 많으므로 결정됨
                 }
             }
         }
         System.out.println(cnt);
    }

/*
 랜덤으로 어떤 경우가 많은지 구하기
 */

//    public static void main(String[] args){
//        //Scanner sc = new Scanner(System.in);
//        Random random = new Random();
//        int rd = random.nextInt(3);
//        int arr[] = new int[]{0,0,0};
//
//        for(int i=0;i<100;i++){
//            if(rd==0)
//                arr[0]++;
//            else if (rd==1)
//                arr[1]++;
//            else if (rd==2)
//                arr[2]++;
//
//        }
//        if(arr[0]>arr[1]){
//            if(arr[0]>arr[2])
//                System.out.println("바위가 승");
//            else
//                System.out.println("보가 승");
//        } else{
//            if(arr[1]>arr[2])
//                System.out.println("가위가 승");
//            else
//                System.out.println("보가 승");
//        }
//    }
}
