module fun

        use mcf_tipos

        public :: F

        contains

        function F(t,r) result(rprima)

        real(kind=dp) , intent(in) :: t
        real(kind=dp) , dimension(:) , intent(in) :: r
        real(kind=dp) , dimension(size(r)) :: rprima
        real(kind=dp) , parameter :: m=1.0_dp

        rprima(1) = r(2)
        rprima(2) = -2.0_dp*r(1)/m
        rprima(3) = r(4)
        rprima(4) = -2.0_dp*r(3)/m

        end function F

end module fun

program body

        use mcf_tipos
        use rk4
        use fun

        real(kind=dp) , parameter :: ta=0.0_dp , tb=7.0_dp , vo=0.0_dp
        real(kind=dp) , dimension(4) :: r
        real(kind=dp) :: t , x1 , x2 , y1 , y2 , h
        integer :: i , j
        integer , parameter :: N=300 , p=5

        open(unit=11,file="3body.dat",action="write",status="replace")

        !STEP
        h = (tb-ta) / N

        do i=1,p !particle number

        t=0.0_dp

        !INITIAL CONDITIONS

        call random_number(x1)
        x1=30.0_dp*x1 - 15.0_dp
        call random_number(x2)
        x2 = x2*30.0_dp - 15.0_dp

        call random_number(y1)
        y1=30.0_dp*y1 - 15.0_dp
        call random_number(y2)
        y2 = y2*30.0_dp - 15.0_dp
        
        r(1) = x1
        r(2) = x2
        r(3) = y1
        r(4) = y2

        do j=1,N

        call rk4_pausoa(t,r,F,h)

        write(unit=11,fmt="(3f16.8)") t , r(1) , r(3)

        end do

        end do

end program body
