<%@page import="java.util.ArrayList"%>
<%@page import="bean.Usuario"%>
<%@page import="java.util.List"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="ls-theme-blue">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>

        <meta charset="utf-8">
        <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
        <meta name="description" content="Insira aqui a descrição da página.">

        <link href="view/stylesheets/locastyle.css" rel="stylesheet" type="text/css">

        <link href="http://assets.locaweb.com.br/locastyle/3.10.1/stylesheets/locastyle.css" rel="stylesheet" type="text/css">
        <link rel="icon" sizes="192x192" href="/locawebstyle/assets/images/ico-boilerplate.png">
        <link rel="apple-touch-icon" href="/locawebstyle/assets/images/ico-boilerplate.png">

        <script src="view/javascripts/highcharts.js" type="text/javascript"></script>
        <script src="view/javascripts/panel-charts.js" type="text/javascript"></script>
    </head>
    <body>



        <div class="ls-topbar ">

            <!-- Barra de Notificações -->
            <div class="ls-notification-topbar">

                <!-- Links de apoio -->
                <div class="ls-alerts-list">
                    <a href="#" class="ls-ico-bell-o" data-counter="8" data-ls-module="topbarCurtain" data-target="#ls-notification-curtain"><span>Notificações</span></a>
                    <a href="#" class="ls-ico-bullhorn" data-ls-module="topbarCurtain" data-target="#ls-help-curtain"><span>Ajuda</span></a>
                    <a href="#" class="ls-ico-question" data-ls-module="topbarCurtain" data-target="#ls-feedback-curtain"><span>Sugestões</span></a>
                </div>

                <!-- Dropdown com detalhes da conta de usuário -->
                <div data-ls-module="dropdown" class="ls-dropdown ls-user-account">
                    <a href="#" class="ls-ico-user">
                        <img src="/locawebstyle/assets/images/locastyle/avatar-example.jpg" alt="" />
                        <%
                            int id = 0;
                            String nome = null;
                            String email = null;

                            List<Usuario> usuario = (ArrayList) session.getAttribute("objUsuario");
                            for (Usuario u : usuario) {
                                id = u.getId();
                                nome = u.getNome();
                                email = u.getEmail();
                                //out.print(u.getNome());
                            }
                        %>
                        <span class="ls-name">Olá <%=nome%>!</span>
                    </a>

                    <nav class="ls-dropdown-nav ls-user-menu">
                        <ul>
                            <li><a href="#">Meus dados</a></li>
                            <li><a href="LogoutController">Sair</a></li>
                        </ul>
                    </nav>
                </div>
            </div>

            <span class="ls-show-sidebar ls-ico-menu"></span>

            <a href="LoginController"  class="ls-go-next"><span class="ls-text">Voltar à lista de serviços</span></a>

            <!-- Nome do produto/marca com sidebar -->
            <h1 class="ls-brand-name">
                <a href="home" class="ls-ico-bars">
                    <small>Sistema de gerenciamento</small>
                    SmartSolutions
                </a>
            </h1>

            <!-- Nome do produto/marca sem sidebar quando for o pre-painel  -->
        </div>


        <aside class="ls-sidebar">

            <div class="ls-sidebar-inner">
                <a href="LoginController"  class="ls-go-prev"><span class="ls-text">Voltar à lista de serviços</span></a>

                <nav class="ls-menu">
                    <ul>
                        <li><a href="LoginController" class="ls-ico-dashboard" title="Dashboard">Dashboard</a></li>
                        <li><a href="CadastrarClienteController" class="ls-ico-user-add" title="Clientes">Cadastro</a></li>
                        <li><a href="MainController?flag=listar" class="ls-ico-users" title="Clientes">Clientes</a></li>
                        <li><a href="OrdemServicoController?flag=listar" class="ls-ico-text2" title="Ordem de Serviço">Ordem Serviço</a></li>
                        <!--<li><a href="pesquisar_cliente.html" class="ls-ico-search" title="Clientes">Pesquisa</a></li>-->
                        <li><a href="/locawebstyle/documentacao/exemplos/painel1/stats" class="ls-ico-stats" title="Relatórios da revenda">Relatórios da revenda</a></li>
                        <li>
                            <a href="#" class="ls-ico-cog" title="Configurações">Configurações</a>
                            <ul>
                                <li><a href="ConfiguracaoEmailController">E-mail de Remetente</a></li>
                                <li><a href="ConfiguracaoAtendimentoController">Atendimento</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>


            </div>
        </aside>


        <main class="ls-main ">
            <!--	    <div class="container-fluid">
                            <h1 class="ls-title-intro ls-ico-home">Página inicial</h1>

                                            <h1>Menu</h1>

                                            <p>Olá <%=nome%>!</p>
                                            <p>Seu ID é: <%=id%></p>
                                            <p>Seu e-mail é: <%=email%></p>
                                            <br>

                                            <h1>Controle Cliente</h1><br>
                                            <a href="cadastrar_cliente.html">Cadastro Cliente</a><br>
                                            <a href="MainController?flag=listar">Listar Cliente</a><br>
                                            <a href="pesquisar_cliente.html">Pesquisar Cliente</a><br>

                                            <br>

                            <p><a href="LogoutController">Sair</a></p>
                        </div>-->
            <!--	</main>
                    <main class="ls-main ">-->
            <div class="container-fluid">
                <h1 class="ls-title-intro ls-ico-dashboard">Dashboard</h1>

                <div class="ls-box ls-board-box">
                    <header class="ls-info-header">
                        <p class="ls-float-right ls-float-none-xs ls-small-info">Valido até <strong>01.05.2014</strong></p>
                        <h2 class="ls-title-3">Consumo de envios</h2>
                    </header>

                    <div id="sending-stats" class="row">
                        <div class="col-sm-6 col-md-3">
                            <div class="ls-box">
                                <div class="ls-box-head">
                                    <h6 class="ls-title-4">Contratado</h6>
                                </div>
                                <div class="ls-box-body">
                                    <span class="ls-board-data">
                                        <strong>1 <small>milhão</small></strong>
                                    </span>
                                </div>
                                <div class="ls-box-footer">
                                    <a href="#" class="ls-btn ls-btn-xs">Alterar plano</a>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-6 col-md-3">
                            <div class="ls-box">
                                <div class="ls-box-head">
                                    <h6 class="ls-title-4">Avulso</h6>
                                </div>
                                <div class="ls-box-body">
                                    <span class="ls-board-data">
                                        <strong>0</strong>
                                    </span>
                                </div>
                                <div class="ls-box-footer">
                                    <a href="#" class="ls-btn ls-btn-xs">Contratar mais envios</a>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-6 col-md-3">
                            <div class="ls-box">
                                <div class="ls-box-head">
                                    <h6 class="ls-title-4">Distribuído</h6>
                                </div>
                                <div class="ls-box-body">
                                    <span class="ls-board-data">
                                        <strong>10.743</strong>
                                    </span>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-6 col-md-3">
                            <div class="ls-box">
                                <div class="ls-box-head">
                                    <h6 class="ls-title-4 color-default">Disponível</h6>
                                </div>
                                <div class="ls-box-body">
                                    <span class="ls-board-data">
                                        <strong class="ls-color-theme">81%</strong>
                                        <small>989.257</small>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="ls-box">
                    <header class="ls-info-header">
                        <h2 class="ls-title-3">Clientes que mais contrataram</h2>
                        <a href="RelatorioController" class="ls-btn ls-btn-sm">Ver mais relatórios</a>
                    </header>

                    <div id="panel-charts"></div>
                </div>

                <div class="row">

                    <div class="col-md-6">
                        <div class="ls-box">
                            <header class="ls-info-header">
                                <h2 class="ls-title-3">Clientes que mais contrataram</h2>
                                <a href="MainController?flag=listar" class="ls-btn ls-btn-sm">Ver todos</a>
                            </header>

                            <table class="ls-table">
                                <thead>
                                <th>Nome do cliente</th>
                                <th>Data de expiração</th>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><a href="MainController?flag=listar">Alex Sistemas de Segurança - ME</a> </td>
                                        <td>14.07.2014</td>
                                    </tr>
                                    <tr>
                                        <td><a href="MainController?flag=listar">Cardoso Sistemas de Segurança - ME</a> </td>
                                        <td>11.07.2014</td>
                                    </tr>
                                    <tr>
                                        <td><a href="MainController?flag=listar">Roberto Sistemas de Segurança - ME</a> </td>
                                        <td>09.03.2014</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="ls-box">
                            <a href="#" class="ls-lnk-nav ls-ico-chevron-right">Política da conta</a>
                        </div>

                    </div>
                    <div class="col-md-6">
                        <div class="ls-box">
                            <header class="ls-info-header">
                                <h2 class="ls-title-3">Clientes bloqueados por bounce</h2>
                                <a href="MainController?flag=listar" class="ls-btn ls-btn-sm">Ver todos</a>
                            </header>

                            <table class="ls-table">
                                <thead>
                                <th>Nome do cliente</th>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><a href="MainController?flag=listar">Rocha Sistemas TI - ME</a> </td>
                                    </tr>
                                    <tr>
                                        <td><a href="MainController?flag=listar">Alex Sistemas de Segurança - ME</a> </td>
                                    </tr>
                                    <tr>
                                        <td><a href="MainController?flag=listar">Roberto Sistemas de Segurança - ME</a> </td>
                                    </tr>

                                    <!--                                <c:forEach var="cliente" items="${listaClientes}">
                                                                        <tr>
                                                                            <td><a href="MainController?flag=editar&idcli=${cliente.id}">${cliente.nome}</a></td>
                                                                        </tr>
                                    </c:forEach>-->
                                </tbody>
                            </table>
                        </div>

                        <div class="ls-box">
                            <a href="#" class="ls-lnk-nav ls-ico-chevron-right">Política de bounce</a>
                        </div>
                    </div>
                </div>


            </div>

            <footer class="ls-footer" role="contentinfo">
                <nav class="ls-footer-menu">
                    <h2 class="ls-title-footer">suporte e ajuda</h2>
                    <ul class="ls-footer-list">
                        <li>
                            <a href="#" target="_blank" class="bg-customer-support">
                                <span class="visible-lg">Atendimento</span>
                            </a>
                        </li>
                        <li>
                            <a href="#" target="_blank" class="bg-my-tickets">
                                <span class="visible-lg">Meus Chamados</span>
                            </a>
                        </li>
                        <li>
                            <a href="#" target="_blank" class="bg-help-desk">
                                <span class="visible-lg">Central de Ajuda (Wiki)</span>
                            </a>
                        </li>
                        <li>
                            <a href="#" target="_blank" class="bg-statusblog">
                                <span class="visible-lg">Statusblog</span>
                            </a>
                        </li>
                    </ul>
                </nav>
                <div class="ls-footer-info">
                    <span class="last-access ls-ico-screen"><strong>Último acesso: </strong>99/99/9999 99:99:99</span>
                    <div class="set-ip"><strong>IP:</strong> 000.00.00.000</div>
                    <p class="ls-copy-right">Copyright © 1997-2017 Serviços de Internet S/A.</p>
                </div>
            </footer>

        </main>


        <!-- We recommended use jQuery 1.10 or up -->
        <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
        <script src="http://assets.locaweb.com.br/locastyle/3.10.1/javascripts/locastyle.js" type="text/javascript"></script>
    </body>
</html>
