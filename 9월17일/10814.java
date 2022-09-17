import java.util.*;

// 백준_<10814>

public class Main {
    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        String[][] arr = new String[n][2];

        for(int i = 0; i<n ; i++) {
            for (int j = 0; j < 2; j++)
                arr[i][j] = sc.next();
        }

        Arrays.sort(arr, new Comparator<String[]>() {
            @Override
            public int compare(String[] o1, String[] o2) {
                // 앞에 저장한 나이만 소트하면 이름은 입력한 순서대로 남아있을 수 있다ㅏ.
                return Integer.parseInt(o1[0]) - Integer.parseInt(o2[0]);
                // 양의 정수, 0, 음의 정수 중 하나를 반환하며, 양의 정수일 경우만 두 객체의 위치를 바꿔준다.

            }
        });

        for(int i=0;i< n;i++) {
            for (int j = 0; j < 2; j++)
                System.out.printf(arr[i][j]+" ");
            System.out.println();
        }

        sc.close();
    }
}

