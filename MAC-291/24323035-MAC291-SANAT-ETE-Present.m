clear; clc; close all;

%% Figure 1: Alpha/Beta/Gamma Overview
A1 = [0, 10]; B1 = [-8.66, -5]; C1 = [8.66, -5];     
D1 = [-2.5, 2]; E1 = [2.5, 2]; F1 = [0, -2.5];      
figure('Color', 'w'); hold on; axis equal; axis off;
outerColor = [0.1 0.1 0.2]; auxColor = [0.2 0.2 0.2]; textColor = [0.2 0.2 0.2];
fontSize = 14;
plot([B1(1) A1(1) C1(1) B1(1)], [B1(2) A1(2) C1(2) B1(2)], 'Color', outerColor, 'LineWidth', 2.5);
plot([A1(1) D1(1)], [A1(2) D1(2)], 'Color', auxColor, 'LineWidth', 1.5);
plot([A1(1) E1(1)], [A1(2) E1(2)], 'Color', auxColor, 'LineWidth', 1.5);
plot([B1(1) D1(1)], [B1(2) D1(2)], 'Color', auxColor, 'LineWidth', 1.5);
plot([B1(1) F1(1)], [B1(2) F1(2)], 'Color', auxColor, 'LineWidth', 1.5);
plot([C1(1) E1(1)], [C1(2) E1(2)], 'Color', auxColor, 'LineWidth', 1.5);
plot([C1(1) F1(1)], [C1(2) F1(2)], 'Color', auxColor, 'LineWidth', 1.5);
plot([D1(1) E1(1) F1(1) D1(1)], [D1(2) E1(2) F1(2) D1(2)], 'Color', outerColor, 'LineWidth', 3.5);
text(-.35, 7.4, '\alpha', 'FontSize', fontSize, 'Color', textColor);
text(0.9, 7.4, '\alpha', 'FontSize', fontSize, 'Color', textColor);
text(-1.5, 7.4, '\alpha', 'FontSize', fontSize, 'Color', textColor);
text(-6.5, -3.5, '\beta', 'FontSize', fontSize, 'Color', textColor);
text(-5.8, -4.5, '\beta', 'FontSize', fontSize, 'Color', textColor);
text(-7.2, -2.5, '\beta', 'FontSize', fontSize, 'Color', textColor);
text(5.5, -3, '\gamma', 'FontSize', fontSize, 'Color', textColor);
text(4.8, -4.5, '\gamma', 'FontSize', fontSize, 'Color', textColor);
text(6, -1.6, '\gamma', 'FontSize', fontSize, 'Color', textColor);
text(-3.8, 2.1, '\gamma^{++}', 'FontSize', fontSize, 'Color', textColor);
text(2.5, 2.4, '\beta^{++}', 'FontSize', fontSize, 'Color', textColor);
text(0, -3.5, '\alpha^{++}', 'FontSize', fontSize, 'Color', textColor, 'HorizontalAlignment', 'center');
text(-3.2, 0.7, '\alpha^+', 'FontSize', fontSize, 'Color', textColor);
text(-2, 2.7, '\beta^+', 'FontSize', fontSize, 'Color', textColor);
text(2, 0.7, '\alpha^+', 'FontSize', fontSize, 'Color', textColor);
text(1, 2.7, '\gamma^+', 'FontSize', fontSize, 'Color', textColor);
text(-1.5, -2.2, '\gamma^+', 'FontSize', fontSize, 'Color', textColor);
text(0.6, -2.2, '\beta^+', 'FontSize', fontSize, 'Color', textColor);
text(0, 0.5, '0^+', 'FontSize', 18, 'FontWeight', 'bold', 'HorizontalAlignment', 'center', 'Color', textColor);
hold off;

%% Figure 2: The S-Circle Construction
alpha1 = 15 * pi/180; alpha2 = 20 * pi/180; alpha3 = 25 * pi/180;
L = 4;
P1 = [0, -L/sqrt(3)]; P2 = [L/2, L/(2*sqrt(3))]; P3 = [-L/2, L/(2*sqrt(3))];
[O1, r1, Q1, R1] = buildReverseCircle([0,0], P2, P3, alpha1);
[O2, r2, Q2, R2] = buildReverseCircle([0,0], P3, P1, alpha2);
[O3, r3, Q3, R3] = buildReverseCircle([0,0], P1, P2, alpha3);
X1 = getIntersect(Q1, R2, R1, Q3);
X2 = getIntersect(Q2, R3, R2, Q1);
X3 = getIntersect(Q3, R1, R3, Q2);
figure('Color', 'w', 'Position', [100, 100, 850, 850]); hold on; axis equal; axis off;
color_S1 = [0.25, 0.40, 0.70]; color_S2 = [0.30, 0.55, 0.35]; color_S3 = [0.55, 0.35, 0.65]; 
color_lines = [0.80, 0.60, 0.20]; color_fill = [0.95, 0.92, 0.85];
drawCircle(O1, r1, color_S1); drawCircle(O2, r2, color_S2); drawCircle(O3, r3, color_S3);
plot([X1(1), X2(1), X3(1), X1(1)], [X1(2), X2(2), X3(2), X1(2)], 'k', 'LineWidth', 2.5);
patch([P1(1), P2(1), P3(1)], [P1(2), P2(2), P3(2)], color_fill, 'EdgeColor', 'none');
plot([P1(1), P2(1), P3(1), P1(1)], [P1(2), P2(2), P3(2), P1(2)], '--', 'Color', color_lines, 'LineWidth', 1.5);
text(X1(1), X1(2) + 0.4, 'X_1', 'FontSize', 16, 'FontWeight', 'bold');
text(P1(1), P1(2) - 0.4, 'P_1', 'FontSize', 14, 'FontWeight', 'bold');
hold off;

%% Figure 3: Angular Sectors at Vertex E
A3 = [0, 10]; B3 = [-8.66, -5]; C3 = [8.66, -5]; E3 = [2.5, 2];
figure('Color', 'w'); hold on; axis equal; axis off;
r_arc = 1.5; cx = E3(1); cy = E3(2);
th_A = atan2(A3(2)-cy, A3(1)-cx); th_D = pi; th_C = atan2(C3(2)-cy, C3(1)-cx); th_F = atan2(-2.5-cy, 0-cx);
fill([cx, cx + r_arc*cos(linspace(th_A, th_D, 50)), cx], [cy, cy + r_arc*sin(linspace(th_A, th_D, 50)), cy], [0.82, 0.88, 0.93], 'EdgeColor', 'none');
fill([cx, cx + r_arc*cos(linspace(th_C, th_A, 50)), cx], [cy, cy + r_arc*sin(linspace(th_C, th_A, 50)), cy], [0.88, 0.84, 0.89], 'EdgeColor', 'none');
plot([B3(1) A3(1) C3(1) B3(1)], [B3(2) A3(2) C3(2) B3(2)], 'Color', [0.1 0.1 0.2], 'LineWidth', 2.5);
text(1.1, 1.2, '0^+', 'FontSize', 18, 'FontWeight', 'bold', 'Color', textColor);
hold off;

%% Figure 4: Unit Circle Chord Intersections
figure('Color', 'w', 'Position', [150, 150, 800, 800]); hold on; axis equal; axis off;
g_circ = [0.65, 0.65, 0.70]; m_edg = [0.15, 0.12, 0.15]; b_ln = [0.35, 0.45, 0.65];
p_ln = [0.55, 0.40, 0.60]; o_ln = [0.85, 0.55, 0.25]; i_fll = [0.90, 0.82, 0.82]; i_edg = [0.65, 0.35, 0.35];
get_pt = @(ang) [cosd(ang), sind(ang)];
A4 = get_pt(-5); B4 = get_pt(85); C4 = get_pt(205);
Pp1 = get_pt(50); Pp2 = get_pt(22); Po1 = get_pt(260);
x_pt = intersectLines(C4, Pp1, B4, Po1);
y_pt = intersectLines(C4, Pp2, B4, Po1);
Pb1 = intersectCircle(A4, x_pt);
Pb2 = intersectCircle(A4, y_pt);
z_pt = intersectLines(A4, Pb1, C4, Pp2);
Po2 = intersectCircle(B4, z_pt);
theta = linspace(0, 360, 300);
plot(cosd(theta), sind(theta), 'Color', g_circ, 'LineWidth', 1.5);
fill([x_pt(1), y_pt(1), z_pt(1)], [x_pt(2), y_pt(2), z_pt(2)], i_fll, 'EdgeColor', 'none');
plot([A4(1), Pb1(1)], [A4(2), Pb1(2)], 'Color', b_ln, 'LineWidth', 1.5);
plot([A4(1), Pb2(1)], [A4(2), Pb2(2)], 'Color', b_ln, 'LineWidth', 1.5);
plot([C4(1), Pp1(1)], [C4(2), Pp1(2)], '--', 'Color', p_ln, 'LineWidth', 1.5);
plot([C4(1), Pp2(1)], [C4(2), Pp2(2)], '--', 'Color', p_ln, 'LineWidth', 1.5);
plot([B4(1), Po1(1)], [B4(2), Po1(2)], '--', 'Color', o_ln, 'LineWidth', 1.5);
plot([B4(1), Po2(1)], [B4(2), Po2(2)], '--', 'Color', o_ln, 'LineWidth', 1.5);
plot([x_pt(1), y_pt(1), z_pt(1), x_pt(1)], [x_pt(2), y_pt(2), z_pt(2), x_pt(2)], 'Color', i_edg, 'LineWidth', 3);
plot([A4(1), B4(1), C4(1), A4(1)], [A4(2), B4(2), C4(2), A4(2)], 'Color', m_edg, 'LineWidth', 3);
text(A4(1)+0.07, A4(2)+0.06, '$a^3$', 'Interpreter', 'latex', 'FontSize', 24);
text(x_pt(1)-0.09, x_pt(2)+0.02, '$x$', 'Interpreter', 'latex', 'FontSize', 18);
xlim([-1.2 1.2]); ylim([-1.2 1.2]);
hold off;

%% Figure 5: Complex Turns
theta_a = -5*pi/180; theta_b = 25*pi/180; theta_c = 70*pi/180;
a = exp(1i*theta_a); b = exp(1i*theta_b); c = exp(1i*theta_c); w = exp(1i*2*pi/3);
figure('Color', 'w'); hold on; axis equal; axis off;
plot(cos(linspace(0, 2*pi, 200)), sin(linspace(0, 2*pi, 200)), 'k', 'LineWidth', 1.2);
plot(real([a^3, b^3, c^3, a^3]), imag([a^3, b^3, c^3, a^3]), 'k', 'LineWidth', 2);
text(real(a^3)*1.15, imag(a^3)*1.15, '$a^3$', 'Interpreter', 'latex', 'FontSize', 16, 'Color', 'k');
hold off;

%% Local Functions
function [O, r, Q, R] = buildReverseCircle(Pc, A, B, alpha)
    M = (A + B) / 2; AB = B - A; N = [-AB(2), AB(1)]; N = N / norm(N);
    if dot(N, M - Pc) < 0, N = -N; end
    O = M + (norm(AB)/2) * cot(alpha) * N; r = norm(A - O);
    phi_A = atan2(A(2) - O(2), A(1) - O(1)); phi_B = atan2(B(2) - O(2), B(1) - O(1));
    delta = mod(phi_B - phi_A + pi, 2*pi) - pi;
    Q = O + r * [cos(phi_B + delta), sin(phi_B + delta)];
    R = O + r * [cos(phi_A - delta), sin(phi_A - delta)];
end
function pt = getIntersect(P1, P2, P3, P4)
    A_mat = [P2(2)-P1(2), P1(1)-P2(1); P4(2)-P3(2), P3(1)-P4(1)];
    b_vec = [A_mat(1,1)*P1(1) + A_mat(1,2)*P1(2); A_mat(2,1)*P3(1) + A_mat(2,2)*P3(2)];
    pt = (A_mat \ b_vec)';
end
function drawCircle(O, r, color)
    t = linspace(0, 2*pi, 200); plot(O(1) + r*cos(t), O(2) + r*sin(t), 'Color', color, 'LineWidth', 1.5);
end
function P = intersectLines(p1, p2, p3, p4)
    den = (p1(1)-p2(1))*(p3(2)-p4(2)) - (p1(2)-p2(2))*(p3(1)-p4(1));
    P(1) = ((p1(1)*p2(2) - p1(2)*p2(1))*(p3(1)-p4(1)) - (p1(1)-p2(1))*(p3(1)*p4(2) - p3(2)*p4(1))) / den;
    P(2) = ((p1(1)*p2(2) - p1(2)*p2(1))*(p3(2)-p4(2)) - (p1(2)-p2(2))*(p3(1)*p4(2) - p3(2)*p4(1))) / den;
end
function P_ext = intersectCircle(p_start, p_through)
    v = p_through - p_start;
    t = -2 * (p_start(1)*v(1) + p_start(2)*v(2)) / (v(1)^2 + v(2)^2);
    P_ext = p_start + t * v;
end