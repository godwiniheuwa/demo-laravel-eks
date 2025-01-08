# # Step 1: Create Namespace
# resource "kubernetes_namespace" "ingress_nginx" {
#   metadata {
#     name = "ingress-nginx"
#   }
# }

# # Step 2: Service Account for NGINX Ingress
# resource "kubernetes_service_account" "nginx_ingress_controller" {
#   metadata {
#     name      = "nginx-ingress-controller"
#     namespace = "default"
#   }
# }

# # Step 3: Cluster Role Binding for Ingress Controller
# resource "kubernetes_cluster_role_binding" "nginx_ingress_controller" {
#   metadata {
#     name = "nginx-ingress-controller"
#   }
#   role_ref {
#     api_group = "rbac.authorization.k8s.io"
#     kind      = "ClusterRole"
#     name      = "cluster-admin"
#   }
#   subject {
#     kind      = "ServiceAccount"
#     name      = "nginx-ingress-controller"
#     namespace = "default"
#   }
# }

# # Step 4: Install NGINX Ingress Controller using Helm
# resource "helm_release" "nginx_ingress" {
#   name       = "nginx-ingress"
#   namespace  = kubernetes_namespace.ingress_nginx.metadata[0].name
#   repository = "https://kubernetes.github.io/ingress-nginx"
#   chart      = "ingress-nginx"
#   version    = " 4.11.2"

#   set {
#     name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-type"
#     value = "nlb"
#   }

#   set {
#     name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-scheme"
#     value = "internet-facing"
#   }

#   set {
#     name  = "controller.service.type"
#     value = "LoadBalancer"
#   }
  
#   depends_on = [kubernetes_namespace.ingress_nginx]
# }

