<%@page import="java.util.ArrayList"%>
<%@page import="bean.Usuario"%>
<%@page import="java.util.List"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="ls-theme-blue">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Configuração Atendimento</title>

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

	    <a href=""  class="ls-go-next"><span class="ls-text">Voltar à lista de serviços</span></a>

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
		<a href=""  class="ls-go-prev"><span class="ls-text">Voltar à lista de serviços</span></a>

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
		<h1 class="ls-title-intro ls-ico-cog">Atendimento</h1>
		<p>Personalize as informações de atendimento que irá oferecer aos seus clientes.</p>

		<div class="row">
		    <div class="col-md-6">
			<div class="ls-box">

			    <h2 class="ls-title-3">Telefone de contato</h2>
			    <p>Cadastre um telefone para que seus clientes possam entrar em contato direto com você. Este telefone será exibido na barra de atendimento quando o seu cliente acessar o seu Email Marketing.</p>

			    <hr>
			    <form action="#" class="ls-form row" data-ls-module="form">
				<label id="phone-form" class="ls-label col-md-5 ls-form-disable">
				    <b class="ls-label-text">Telefone</b>
				    <input class="ls-mask-phone_with_ddd" name="telefone" placeholder="Número do telefone" required="" type="text" value="(11) 99999-9999">
				</label>
				<div class="phone-actions ls-display-none">
				    <button type="submit" class="ls-btn-primary">Salvar</button>
				    <button class="ls-btn" data-ls-fields-enable="#phone-form" data-toggle-class="ls-display-none" data-target=".phone-actions" >Cancelar</button>
				</div>
				<button data-ls-fields-enable="#phone-form" data-toggle-class="ls-display-none" data-target=".phone-actions" class="ls-btn-primary phone-actions">Editar</button>
			    </form>
			</div>
		    </div>
		    <div class="col-md-6">
			<div class="ls-box ls-equal-height-box-2">

			    <h2 class="ls-title-3">Webdesk</h2>
			    <p>Configure a sua conta do WebDesk para atender as solicitaçoes dos seus clientes através de chamados.</p>

			    <hr>
			    <form action="#" class="ls-form" data-ls-module="form">
				<div id="webdesk-form" class="ls-form-disable">
				    <label class="ls-label">
					<div class="ls-prefix-group">
					    <span class="ls-label-text-prefix">https://</span>
					    <input type="text" placeholder="entregaemails">
					    <span class="ls-label-text-prefix">.webdesklw.com.br</span>
					</div>
				    </label>
				</div>

				<div class="webdesk-actions ls-display-none">
				    <button type="submit" class="ls-btn-primary">Salvar</button>
				    <button class="ls-btn" data-ls-fields-enable="#webdesk-form" data-toggle-class="ls-display-none" data-target=".webdesk-actions">Cancelar</button>
				</div>
				<button data-ls-fields-enable="#webdesk-form" data-toggle-class="ls-display-none" data-target=".webdesk-actions" class="ls-btn-primary webdesk-actions">Editar</button>
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


	<aside class="ls-notification">
	    <nav class="ls-notification-list" id="ls-notification-curtain">
		<h3 class="ls-title-2">Notificações</h3>
		<ul>
		    <li class="ls-dismissable">
			<a href="#">Sint magni quis voluptatum libero sed temporibus</a>
			<a href="#" data-ls-module="dismiss" class="ls-ico-close ls-close-notification"></a>
		    </li>
		    <li class="ls-dismissable">
			<a href="#">Numquam molestiae voluptatum vero et</a>
			<a href="#" data-ls-module="dismiss" class="ls-ico-close ls-close-notification"></a>
		    </li>
		    <li class="ls-dismissable">
			<a href="#">Sunt et beatae est sapiente occaecati commodi ipsa voluptatibus quis dicta ipsum in</a>
			<a href="#" data-ls-module="dismiss" class="ls-ico-close ls-close-notification"></a>
		    </li>
		    <li class="ls-dismissable">
			<a href="#">Eius velit voluptate eos qui vitae</a>
			<a href="#" data-ls-module="dismiss" class="ls-ico-close ls-close-notification"></a>
		    </li>
		    <li class="ls-dismissable">
			<a href="#">Id voluptatem minima quisquam facere qui ea cupiditate exercitationem aut est quam</a>
			<a href="#" data-ls-module="dismiss" class="ls-ico-close ls-close-notification"></a>
		    </li>
		</ul>
		<p class="ls-no-notification-message">Não há notificações.</p>
	    </nav>
	    <nav class="ls-notification-list" id="ls-help-curtain">
		<h3 class="ls-title-2">Feedback</h3>
		<ul>
		    <li><a href="#">> adipisci rerum recusandae exercitationem vero rem</a></li>
		    <li><a href="#">> quia odit voluptatem minus eum dolorem</a></li>
		</ul>
	    </nav>
	    <nav class="ls-notification-list" id="ls-feedback-curtain">
		<h3 class="ls-title-2">Ajuda</h3>
		<ul>
		    <li class="ls-txt-center hidden-xs">
			<a href="#" class="ls-btn-dark ls-btn-tour">Fazer um Tour</a>
		    </li>
		    <li><a href="#">> Guia</a></li>
		    <li><a href="#">> Wiki</a></li>
		</ul>
	    </nav>
	</aside>







	<!-- We recommended use jQuery 1.10 or up -->
	<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script src="http://assets.locaweb.com.br/locastyle/3.10.1/javascripts/locastyle.js" type="text/javascript"></script>
    </body>
</html>

