
// Chap3_디바이스_콘텍스트View.cpp: CChap3디바이스콘텍스트View 클래스의 구현
//

#include "pch.h"
#include "framework.h"
// SHARED_HANDLERS는 미리 보기, 축소판 그림 및 검색 필터 처리기를 구현하는 ATL 프로젝트에서 정의할 수 있으며
// 해당 프로젝트와 문서 코드를 공유하도록 해 줍니다.
#ifndef SHARED_HANDLERS
#include "Chap3_디바이스_콘텍스트.h"
#endif

#include "Chap3_디바이스_콘텍스트Doc.h"
#include "Chap3_디바이스_콘텍스트View.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif


// CChap3디바이스콘텍스트View

IMPLEMENT_DYNCREATE(CChap3디바이스콘텍스트View, CView)

BEGIN_MESSAGE_MAP(CChap3디바이스콘텍스트View, CView)
	ON_WM_CHAR()
	ON_WM_LBUTTONDOWN()
	ON_WM_MOUSEMOVE()
	ON_WM_LBUTTONUP()
END_MESSAGE_MAP()

// CChap3디바이스콘텍스트View 생성/소멸

CChap3디바이스콘텍스트View::CChap3디바이스콘텍스트View() noexcept
{
	// TODO: 여기에 생성 코드를 추가합니다.

}

CChap3디바이스콘텍스트View::~CChap3디바이스콘텍스트View()
{
}

BOOL CChap3디바이스콘텍스트View::PreCreateWindow(CREATESTRUCT& cs)
{
	// TODO: CREATESTRUCT cs를 수정하여 여기에서
	//  Window 클래스 또는 스타일을 수정합니다.

	return CView::PreCreateWindow(cs);
}

// CChap3디바이스콘텍스트View 그리기

void CChap3디바이스콘텍스트View::OnDraw(CDC* pDC)
{
	CChap3디바이스콘텍스트Doc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	if (!pDoc)
		return;

	// TODO: 여기에 원시 데이터에 대한 그리기 코드를 추가합니다.

	// 사각형 그리기 
	CPen pen, * oldPen;

	pen.CreatePen(PS_SOLID, 1, m_PenColor); // 펜 객체 생성
	oldPen = pDC->SelectObject(&pen); // 전에 있던 펜 정보를 oldPen에 저장
	pDC->Rectangle(m_ptLeftTop.x, m_ptLeftTop.y,
		m_ptRightBottom.x, m_ptRightBottom.y); // 디바이스 콘텍스트에 등록된 펜이 그려짐
	pDC->SelectObject(oldPen);
	pen.DeleteObject(); // 객체 소멸

	CRect rt; // 박스 영역 지정 시 사용
	rt.left = 100;
	rt.top = 100;
	rt.right = 300;
	rt.bottom = 200;
	pDC->DrawText(L"최유리\n202103725", &rt, DT_CENTER | DT_VCENTER);

}


// CChap3디바이스콘텍스트View 진단

#ifdef _DEBUG
void CChap3디바이스콘텍스트View::AssertValid() const
{
	CView::AssertValid();
}

void CChap3디바이스콘텍스트View::Dump(CDumpContext& dc) const
{
	CView::Dump(dc);
}

CChap3디바이스콘텍스트Doc* CChap3디바이스콘텍스트View::GetDocument() const // 디버그되지 않은 버전은 인라인으로 지정됩니다.
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CChap3디바이스콘텍스트Doc)));
	return (CChap3디바이스콘텍스트Doc*)m_pDocument;
}
#endif //_DEBUG


// CChap3디바이스콘텍스트View 메시지 처리기


void CChap3디바이스콘텍스트View::OnChar(UINT nChar, UINT nRepCnt, UINT nFlags)
{	// 입력된 문자열 저장 메소드

	// TODO: 여기에 메시지 처리기 코드를 추가 및 또는 기본값을 호출합니다.

	switch (nChar) {
	case 'r':
		m_PenColor = RGB(255, 0, 0);
		break;
	case 'g':
		m_PenColor = RGB(0, 255, 0);
		break;
	case 'b':
		m_PenColor = RGB(0,0,255);
		break;
	}

	CView::OnChar(nChar, nRepCnt, nFlags);
}


void CChap3디바이스콘텍스트View::OnLButtonDown(UINT nFlags, CPoint point)
{
	// TODO: 여기에 메시지 처리기 코드를 추가 및/또는 기본값을 호출합니다.

	m_ptLeftTop = point; // 마우스를 클릭시 왼쪽/탑 좌표에 해당 좌표 저장

	CView::OnLButtonDown(nFlags, point);
}


void CChap3디바이스콘텍스트View::OnMouseMove(UINT nFlags, CPoint point)
{	// 마우스가 이동하면 point에 저장된 좌표를 가지고 수행됨

	// TODO: 여기에 메시지 처리기 코드를 추가 및/또는 기본값을 호출합니다.

	if (nFlags & MK_LBUTTON) { // 마우스 이동인지 드래그인지 판별
		m_ptRightBottom = point; // 만약 드래그 중이면 해당 좌표를 m_ptRightBottom에 저장하고
		Invalidate(); // 뷰 영역을 무효화시킴
	}

	CView::OnMouseMove(nFlags, point);
}


void CChap3디바이스콘텍스트View::OnLButtonUp(UINT nFlags, CPoint point)
{	// 마우스 클릭을 종료하면

	// TODO: 여기에 메시지 처리기 코드를 추가 및/또는 기본값을 호출합니다.

	m_ptRightBottom = point; // 마지막으로 클릭된 지점 좌표를 저장
	// 라이트/바텀 좌표값을 현재 좌표값으로 대입
	Invalidate(); // 뷰 영역 무효화

	CView::OnLButtonUp(nFlags, point);
}
