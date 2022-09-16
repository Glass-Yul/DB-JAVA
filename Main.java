//import java.util.Collections;
//import java.util.Arrays;
import java.util.Scanner;

public class Main {
    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);
        int up = sc.nextInt(); // 올라간 길이
        int down = sc.nextInt(); // 미끄러진 길이
        int len = sc.nextInt(); // 올라갈 높이

        int distance = len - up; // 첫날을 제외한 길이
        int move = up - down; // 하루동안 움직이는 거리
        int days = (int)Math.ceil((double)distance/move) + 1;
        // 이동한 후 .xx가 남을 수 있으니 내장함수를 사용해 올림해준 후 제외했던 첫날을 더해준다.

        System.out.println(days);

    }
}

/*
<2869> 달팽이가 꼭대기로 올라는 총 기간 구하기 ==> 시간 초과

public class Main {
    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);
        int up = sc.nextInt(); // 올라간 길이
        int down = sc.nextInt(); // 미끄러진 길이
        int len = sc.nextInt(); // 올라갈 높이
        int count = 0; // 걸린 기간
        int hap = 0; // 총 합

        while(true){
            hap+=up;
            count++;
            if(hap>=len){
                System.out.println(count);
                break;
            }
            hap-=down; // 해당 높이에 도달하면 미끄러지지 않기 때문에 if문 뒤에 씀
            
        }
    }
}
*/

