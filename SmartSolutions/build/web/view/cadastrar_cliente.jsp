<%@page import="java.util.ArrayList"%>
<%@page import="bean.Usuario"%>
<%@page import="java.util.List"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="ls-theme-blue">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar</title>

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
                        <!--<li><a href="pesquisar_cliente.html" class="ls-ico-search" title="Clientes">Pesquisa</a></li>-->
                        <li><a href="RelatorioController" class="ls-ico-stats" title="Relatórios da revenda">Relatórios da revenda</a></li>
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
            <div class="container-fluid">
                <h1 class="ls-title-intro ls-ico-users">Cadastrar</h1>



                <div class="ls-box">
                    <header class="ls-info-header">
                        <h2 class="ls-title-3">Informe os dados abaixo</h2>
                        <!--<a href="#" class="ls-btn ls-btn-sm">Ver mais relatórios</a>-->
                    </header>

                    <div class="alert alert-success">
                        <input type="hidden" id="mensagem" value="<c:out value="${mensagem}"/>"/>
                        <script type="text/javascript">
                            var result = document.getElementById('mensagem').value;
                            if (result != null && result != "")
                            {
                                alert(result);
                            }
                        </script>

                    </div>

                    <div id="panel-charts" style="margin-left: 200px;margin-right: 200px;">

                        <form name="cadastro" action="MainController" method="post" class="">
                            <fieldset>
                                <label class="ls-label col-md-12">
                                    <!--<b class="ls-label-text">Crie sua conta</b>-->
                                    <p class="s-label-info"></p>
                                </label>
                                <label class="ls-label col-md-12">
                                    <b class="ls-label-text">Nome:*</b>
                                    <p class="s-label-info">Informe o nome de sua empresa. Pessoa física? Use seu nome.</p>
                                    <input type="text" name="nome" placeholder="" required >
                                </label>
                                <label class="ls-label col-md-12">
                                    <b class="ls-label-text">CNPJ:</b>
                                    <p class="ls-label-info">Informar seu CNPJ dará maior credibilidade pra você. Se não tiver ainda, deixe em branco.</p>
                                    <input type="text" name="cnpj" placeholder="" required >
                                </label>
                                <label class="ls-label col-md-12">
                                    <b class="ls-label-text">Telefone:</b>
                                    <p class="ls-label-info">Se for mais de um, separe por vírgulas. Caso prefira contato por email, deixe em branco. </p>
                                    <input type="text" name="telefone" placeholder="" required >
                                </label>
                                <label class="ls-label col-md-12">
                                    <b class="ls-label-text">Estado:</b>
                                    <!-- <p class="ls-label-info"> </p> -->
                                    <div class="ls-custom-select">
                                        <select class="ls-select" name="estado">
                                            <option value="">Selecione um Estado</option><option value="AC">Acre</option><option value="AL">Alagoas</option><option value="AP">Amapá</option><option value="AM">Amazonas</option><option value="BA">Bahia</option><option value="CE">Ceará</option><option value="DF">Distrito Federal</option><option value="ES">Espí­rito Santo</option><option value="GO">Goiás</option><option value="MA">Maranhão</option><option value="MT">Mato Grosso</option><option value="MS">Mato Grosso do Sul</option><option value="MG">Minas Gerais</option><option value="PA">Pará</option><option value="PB">Paraíba</option><option value="PR">Paraná</option><option value="PE">Pernambuco</option><option value="PI">Piauí</option><option value="RJ">Rio de Janeiro</option><option value="RN">Rio Grande do Norte</option><option value="RS">Rio Grande do Sul</option><option value="RO">Rondônia</option><option value="RR">Roraima</option><option value="SC">Santa Catarina</option><option value="SP">São Paulo</option><option value="SE">Sergipe</option><option value="TO">Tocantins</option>
                                        </select>
                                    </div>
                                </label>
                                <label class="ls-label col-md-12">
                                    <b class="ls-label-text">Cidade:</b>
                                    <p class="ls-label-info"></p>
                                    <input type="text" name="cidade" placeholder="" required >
                                </label>
                                <label class="ls-label col-md-12">
                                    <b class="ls-label-text">Bairro:</b>
                                    <p class="ls-label-info"></p>
                                    <input type="text" name="bairro" placeholder="" required >
                                </label>
                                <label class="ls-label col-md-12">
                                    <b class="ls-label-text">CEP:</b>
                                    <p class="ls-label-info"></p>
                                    <input type="text" name="cep" placeholder="" required >
                                </label>
                                <label class="ls-label col-md-12">
                                    <b class="ls-label-text">Endereco:</b>
                                    <p class="ls-label-info"></p>
                                    <input type="text" name="endereco" placeholder="" required >
                                </label>
                                <label class="ls-label col-md-12">
                                    <b class="ls-label-text">Usuário:</b>
                                    <p class="ls-label-info">Escolha um nome de usuário para login</p>
                                    <input type="text" name="usuario" placeholder="" required="">
                                </label>
                                <label class="ls-label col-md-12">
                                    <b class="ls-label-text">E-mail:</b>
                                    <p class="ls-label-info"></p>
                                    <input type="email" name="email" placeholder="" required >
                                </label>
                                <label class="ls-label col-md-12">
                                    <b class="ls-label-text">Senha:</b>
                                    <p class="ls-label-info"></p>
                                    <input type="password" name="senha" placeholder="" required >
                                </label>
                            </fieldset>

                            <hr>

                            <!--<div style="text-align: center;">
                                                <fieldset class="btn-pad-cadastro">
                                                    <button href="" type="submit" class="btn btn-primary">Enviar Cadastro!</button>
                                                    <a href="index.php" class="btn btn-danger">Cancelar</a>
                                                    <a href="login.php" class="btn btn-success">Já tenho Cadastro</a>
                                                </fieldset>
                                            </div>-->

                            <label>&nbsp;</label><input type="submit" name="btCadastrar" value="Cadastrar" class="ls-btn-primary" style="width: 110px;">

                            <input type="hidden" name="flag" value="cadastrar">
                            <a href="MainController?flag=listar" style="margin-left: 30px;" class="ls-btn-logout">Carregar lista</a>

                            <!--<input type="button" name="btVoltar" onclick="history.go(-1);" value="Voltar" class="botao btn btn-danger">-->

                            <!--<br>-->
                            <!--<hr>-->
                            <!--<a href="cadastrar_cliente.html" class="ls-btn-primary">Cadastrar novo</a>-->
                            <!--<a href="MainController?flag=listar" class="ls-btn-primary">Carregar lista</a>-->
                        </form>
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

