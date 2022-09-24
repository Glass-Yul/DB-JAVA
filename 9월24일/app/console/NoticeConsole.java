package jdbc.app.console;

import jdbc.app.entity.Notice;
import jdbc.app.service.NoticeService;

import java.sql.SQLException;
import java.util.List;
import java.util.Scanner;

public class NoticeConsole {
    private NoticeService service;
    private int page;

    public NoticeConsole(){ // 생성자
        service = new NoticeService();
        page = 1;
    }

    public void printNoticeList() throws SQLException, ClassNotFoundException { // 출력
        List<Notice> list = service.getList(page);
        int count = service.getCount();
        int lastPage = count/3;

        System.out.println("─────────────────────────────────────────────────────────");
        System.out.printf("\t\t\t\t<공지사항> 총 %d 게시글\n", count);
        System.out.println("─────────────────────────────────────────────────────────");

        for(Notice n : list) {
            System.out.printf("%8s / %35s / %5d / %6d\n",
                    n.getId(),
                    n.getTitle(),
                    n.getMin(),
                    n.getMax());
        }
        System.out.println("─────────────────────────────────────────────────────────");
        System.out.printf("\t\t\t\t\t %d/%d page\n", page, lastPage);

    }

    public int inputNoticeMenu() { // 메뉴
        Scanner sc = new Scanner(System.in);

        System.out.printf("\n1.상세조희 / 2.이전 / 3.다음 / 4.글쓰기 / 0.종료 : ");
        String menu_ = sc.nextLine();
        int menu = Integer.parseInt(menu_);

        return menu;
    }

    public void movePrevList() { // 이전
        if(page==1) {
            System.out.println("첫 페이지 입니다.");
            return;
        }
        page--;
    }

    public void moveNextList() { // 이후

        page++;
    }
}
